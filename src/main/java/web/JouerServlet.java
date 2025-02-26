package web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Traitement;

@WebServlet({"/jeu", "/payer"})
public class JouerServlet extends HttpServlet {

    private Traitement traitement;

    @Override
    public void init() throws ServletException {
        traitement = new Traitement();
        traitement.setNbr_limite(100);
        traitement.setMax(3);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getServletContext().setAttribute("nbr_limite", traitement.getNbr_limite());
        req.getServletContext().setAttribute("max", traitement.getMax());
        if (req.getServletPath().equals("/payer")) {
            req.getSession().setAttribute("doitjouer", 1);
            req.getSession().setAttribute("nbr_tentatives", 0);
            traitement.genererNombre();
            req.getServletContext().setAttribute("nbral", traitement.getNombre_aleatoire());
        } else {
            req.getSession().setAttribute("doitjouer", 0);
        }

        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer nbr_tentatives = (Integer) req.getSession().getAttribute("nbr_tentatives");
        System.out.println(traitement.getNombre_aleatoire());

        if (nbr_tentatives == null) {
            nbr_tentatives = 0;
        }

        String nbr_txt = req.getParameter("nombre_aleatoire");

        try {
            int nombre_saisi = Integer.parseInt(nbr_txt);

            if (nombre_saisi < 0) {
                req.setAttribute("nbr_txt", nombre_saisi);
                req.setAttribute("nbr_error", "Veuillez saisir un nombre positif !");
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
                return;
            }

            int result = traitement.verifierNombre(nombre_saisi);

            if (result == 0) {
                // Le joueur a trouvé le bon nombre
                req.setAttribute("msg", "Bravo !  Vous avez gagné 5 DH ✌️🏆 Douz 3nd la caisse !");
                req.setAttribute("type_msg", "alert-success");
                req.getSession().setAttribute("doitjouer", 0);
                req.getSession().setAttribute("nbr_tentatives", nbr_tentatives + 1);
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
                return;
            }

            // Si ce n'est pas le bon nombre, on incrémente les tentatives
            nbr_tentatives++;

            if (nbr_tentatives >= traitement.getMax()) {
                req.getSession().setAttribute("doitjouer", 0);
                req.setAttribute("msg", "Nombre de tentatives dépassé ! 🤣 Le nombre était : " + traitement.getNombre_aleatoire());
                req.setAttribute("type_msg", "alert-danger");
            } else {
                req.setAttribute("msg", result == -1 ? "Un nombre plus petit !" : "Un nombre plus grand !");
                req.setAttribute("type_msg", "alert-warning");
                req.getSession().setAttribute("nbr_tentatives", nbr_tentatives);
            }

        } catch (NumberFormatException e) {
            req.setAttribute("nbr_txt", nbr_txt);
            req.setAttribute("nbr_error", "Veuillez saisir un nombre valide !");
        }

        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

}
