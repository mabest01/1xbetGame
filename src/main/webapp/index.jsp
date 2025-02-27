<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Jeu du Nombre Aléatoire</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .footer {
            text-align: center;
            font-size: 16px;
            font-family: Arial, sans-serif;
            color: #fff;
            background-color: #333;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            width: fit-content;
            margin: 20px auto;
        }
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            font-family: Arial, sans-serif;
        }
        .card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
        }
        .card-header {
            font-size: 1.3rem;
            font-weight: bold;
        }
        .btn {
            transition: 0.3s ease-in-out;
        }
        .btn:hover {
            opacity: 0.8;
        }
        .alert {
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- La musique se lit automatiquement et en boucle -->
<audio id="bg-music" autoplay loop controls>
    <source src="1xbet.mp3" >
    Your browser does not support the audio tag.
</audio>

<div class="text-center my-4">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ33xEI8VEfsLnYAU8cWIK3eapXD3t7eBHEJw&s"
         alt="Logo" class="img-fluid rounded shadow-lg" style="max-width: 200px; height: auto;">
</div>

<div class="container mt-4">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white text-center py-3">
            <h1>Jeu du Nombre Magique !</h1>
            <p class="fs-5">Entrez un nombre entre 0 et <strong>${nbr_limite}</strong> C'est : </p>
            <p class="fst-italic">💰 Coût du jeu : <strong>1 DH</strong> | 🏆 Prix du gagnant : <strong>5 DH</strong> !</p>
        </div>

        <div class="card-body">

            <c:if test="${msg != null}">
                <div class="alert ${type_msg} text-center">
                    <strong>${msg}</strong>
                </div>
            </c:if>

            <form action="jeu" method="post">
                <div class="mb-3">
                    <label class="form-label fw-bold">Entrer une valeur :</label>
                    <input class="form-control form-control-lg text-center" value="${nbr_txt}" type="text" name="nombre_aleatoire">
                </div>

                <c:if test="${nbr_error != null}">
                    <div class="alert alert-danger text-center">
                        <strong>${nbr_error}</strong>
                    </div>
                </c:if>

                <div class="row g-3">
                    <div class="col-md-6 text-center">
                        <!-- Le bouton ne fait plus jouer la musique, il se contente de soumettre le formulaire -->
                        <button type="submit" class="btn btn-success w-100 py-2 fs-5" ${ doitjouer == 0 ? 'disabled' : '' }>🎲 Jouer</button>
                    </div>
                    <div class="col-md-6 text-center">
                        <a href="payer" class="btn btn-warning w-100 py-2 fs-5" ${ doitjouer != 0 ? 'disabled' : '' }>💳 Payer / Réinitialiser</a>
                    </div>
                </div>
            </form>

        </div>

        <div class="card-footer text-muted text-center py-2">
            <c:if test="${sessionScope.doitjouer == 1}">
                <small>⏳ Nombre de tentatives restantes : <strong>${(sessionScope.nbr_tentatives != null ? sessionScope.nbr_tentatives : 0 )+1}</strong> / 3</small>
            </c:if>
        </div>
    </div>
</div>

<div class="footer">
    Made with ❤️ by <strong>EL MAHDI ALOUI</strong> 2025
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
