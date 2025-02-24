package metier;

import java.util.Random;

public class Traitement {

    private int nombre_aleatoire;
    private int max; // tentatives
    private int nbr_limite;

    public int getNombre_aleatoire() {
        return nombre_aleatoire;
    }

    public void setNombre_aleatoire(int nombre_aleatoire) {
        this.nombre_aleatoire = nombre_aleatoire;
    }

    public int getMax() {
        return max;
    }
    public void setMax(int max) {
        this.max = max;
    }
    public int getNbr_limite() {
        return nbr_limite;
    }

    public void setNbr_limite(int nbr_limite) {
        this.nbr_limite = nbr_limite;
    }

    public void genererNombre() {

        Random rand = new Random();
        nombre_aleatoire = rand.nextInt(0, this.nbr_limite);

    }

    public int verifierNombre(int nombre_saisi) {

        if(nombre_saisi > nombre_aleatoire)
            return -1;
        else if(nombre_saisi < nombre_aleatoire)
            return 1;
        else
            return 0;

    }

    public boolean nombreTentatives(int nbr_courant) {
        return nbr_courant > this.max ? false :  true;
    }

}
