<%@page import="com.jee.beans.DocumentJ"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.9.13, a.mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/photo-1562564055-71e051d33c19-h_lw814ud0.jpg" type="image/x-icon">
  <meta name="description" content="DocUnity est un système d'information documentaire révolutionnaire qui simplifie la gestion de vos documents. Découvrez comment DocUnity peut améliorer votre flux de travail dès aujourd'hui!">
  <title>Gestion Documentaire Simplifiée</title>
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/web/assets/mobirise-icons2/mobirise2.css?rnd=1715790563548">
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/bootstrap/css/bootstrap.min.css?rnd=1715790563548">
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/bootstrap/css/bootstrap-grid.min.css?rnd=1715790563548">
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/bootstrap/css/bootstrap-reboot.min.css?rnd=1715790563548">
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/parallax/jarallax.css?rnd=1715790563548">
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/dropdown/css/style.css?rnd=1715790563548">
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/socicon/css/styles.css?rnd=1715790563548">
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/theme/css/style.css?rnd=1715790563548">
  <link rel="preload" href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;700&display=swap&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;700&display=swap&display=swap"></noscript>
  <link rel="stylesheet" href="https://r.mobirisesite.com/444573/assets/css/mbr-additional.css?rnd=1715790563548" type="text/css">
  
  <style>
  .table-row-button {
    cursor: pointer; /* Change le curseur en une main au survol */
  }

  .table-row-button:hover {
    background-color: lightgray; /* Change la couleur de fond au survol */
  }
</style>

<style>
  .custom-table {
    width: 90%; /* Augmentez la largeur de la table */
    margin: 0 auto; /* Centrez la table horizontalement */
  }

  th, td {
    white-space: nowrap; /* Empêche le texte de se couper s'il est trop long */
    overflow: hidden; /* Cache tout texte qui dépasse la largeur de la cellule */
    text-overflow: ellipsis; /* Ajoute des points de suspension pour indiquer un texte tronqué */
  }

  th.filePath, td.filePath {
    width: 15%; /* Augmentez la largeur de la colonne filePath */
  }
</style>

<style>
  .delete-btn {
    position: relative;
    background-color: #ff4d4d;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    color: white;
    font-size: 1em;
    cursor: pointer;
    display: flex;
    align-items: center;
  }

  .delete-btn img {
    width: 20px;
    height: 20px;
    margin-right: 10px;
  }

  .modal {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(50%, -150%);
    width: 300px;
    height: 200px;
    background: white;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    z-index: 1000;
  }

  .modal button {
    margin: 5px;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .modal .delete-forever {
    background-color: #ff4d4d;
    color: white;
    width: 100px;
    height: 100px;
  }

  .modal .move-to-trash {
    background-color: #cccccc;
    color: black;
    width: 100px;
    height: 100px;
  }

  .modal-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 999;
  }
</style>
  

  <script>
  function setFilePathToDelete(filePath) {
      document.getElementById('filePathToDelete').value = filePath;
  }
  
  function showModal() {
    document.getElementById('deleteModal').style.display = 'block';
  }

  function hideModal() {
    document.getElementById('deleteModal').style.display = 'none';
  }

  function deleteAlert() {
      if (confirm('Are you sure you want to delete this file forever?')) {
          // If the user confirms, submit the form with the file path to be deleted
          document.getElementById('deleteForm').submit();
      }
      hideModal(); // Make sure to hide the modal after confirmation or cancellation
  }

  function trashAlert() {
      if (confirm('Are you sure you want to move this item to trash?')) {
          // If the user confirms, submit the form with the file path to be deleted
          document.getElementById('deleteForm').submit();
      }
      hideModal(); // Make sure to hide the modal after confirmation or cancellation
  }


//Fonction pour afficher une alerte lors de la suppression définitive du fichier
  function deleteAlert() {
      if (confirm('Are you sure you want to delete this file forever?')) {
          // Si l'utilisateur confirme, alors seulement soumettre le formulaire
          document.getElementById('deleteForm').submit();
      }
      hideModal(); // Assurez-vous de masquer le modal après la confirmation ou l'annulation
  }

  function trashAlert() {
      if (confirm('Are you sure you want to move this item to trash?')) {
          // Si l'utilisateur confirme, alors seulement soumettre le formulaire
          document.getElementById('deleteForm').submit();
      }
      hideModal(); // Assurez-vous de masquer le modal après la confirmation ou l'annulation
  }

</script>
  
</head>
<body style="height: 1000px;">
<!-- Fenêtre modale -->
<div class="modal" id="trashModal">
    <p>Le document a été déplacé vers la corbeille.</p>
    <button onclick="hideTrashModal()">OK</button>
</div>


  <section data-bs-version="5.1" class="menu menu2 cid-ucPZPdQwpo" once="menu" id="menu-5-ucPZPdQwpo">
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="https://mobiri.se">
                        <img src="assets/images/photo-1562564055-71e051d33c19-h_lw814ud0.jpg" alt="Mobirise Website Builder" style="height: 4.3rem;">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-black display-5" href="https://mobiri.se">DocUnity</a></span>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-bs-toggle="collapse" data-target="#navbarSupportedContent" data-bs-target="#navbarSupportedContent" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown nav-right" data-app-modern-menu="true"><li class="nav-item">
                        
                    </li><li class="nav-item">
                        <a class="nav-link link text-black display-7" href="index.html">Accueil</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link link text-black display-7" href="admini.html">Admin</a>
                    </li></ul>
            </div>
        </div>
    </nav>
</section>

<section data-bs-version="5.1" class="header10 cid-ucPZPdSHLp mbr-fullscreen mbr-parallax-background" id="hero-50-ucPZPdSHLp">
  <div class="container-fluid">
    <div class="row">
      <div class="content-wrap col-60 col-md-60">
        <h1 class="mbr-section-title mbr-fonts-style mbr-white mb-4 display-1" style="margin-top: 50px;">
          <strong>Liste des documents</strong>
      </h1>
        <div class="container"></div>
        <div class="row justify-content-center">
          <div class="col-lg-8 mx-auto mbr-form" data-form-type="formoid">
          <% 
            List<DocumentJ> dl = (List<DocumentJ>)request.getAttribute("dl");
          %>
          
            <form action="getallfilesbyuser.do" method="post">
                <div class="table-responsive">
                    <table class="table table-striped rounded-lg custom-table" style="background-color: white; border-radius: 20px;">
                        <thead>
                            <tr>
                                <th scope="col">filePath</th>
                                <th scope="col">fileName</th>
                                <th scope="col">fileType</th>
                                <th scope="col">fileSize</th>
                                <th scope="col" style="width: 30%;">fileDescp</th>
                                <th scope="col">fileUser</th>
                                <th scope="col" style="width: 15%;">Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Exemple de document stocké -->
                            <% for(int i = 0; i < dl.size(); i++) { %>
                            <tr class="table-row-button" onclick="handleRowClick2('<%=dl.get(i).getFilePath()%>', '<%=dl.get(i).getFileName()%>', '<%=dl.get(i).getFileType()%>', '<%=dl.get(i).getFileSize()%>', '<%=dl.get(i).getFileDescp()%>', '<%=dl.get(i).getFileUser()%>')">
  <td data-fileName="<%=dl.get(i).getFileName()%>"><%=dl.get(i).getFilePath() %></td>
  <td><%=dl.get(i).getFileName() %></td>
  <td><%=dl.get(i).getFileType() %></td>
  <td><%=dl.get(i).getFileSize() %></td>
  <td style="width: 30%;"><%=dl.get(i).getFileDescp() %></td>
  <td><%=dl.get(i).getFileUser() %></td>
  <td>
    <button type="button" class="delete-btn" onclick="event.stopPropagation(); setFilePathToDelete('<%=dl.get(i).getFilePath()%>'); showModal()">
        <img src="delete.png" alt="Delete"> Delete
    </button>
  </td>
</tr>
                            
                            
                            <% } %>
                            <!-- Ajouter d'autres lignes pour chaque document stocké -->
                        </tbody>
                    </table>
                </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Fenêtre modale -->
<div class="modal" id="deleteModal">
    <p>Are you sure you want to delete this item?</p>
    <form id="deleteForm" action="delete.do" method="post">
        <input type="hidden" id="filePathToDelete" name="filePathToDelete">
        <input type="hidden" name="action" value="deleteForever"> <!-- Paramètre pour l'action -->

        <!-- Modifier le bouton pour appeler la fonction deleteAlert() -->
        <button type="button" onclick="deleteAlert()" class="delete-forever" name="deleteForever">Delete Forever</button>
        
        <!-- Bouton "Move to Trash" -->
        <button type="button" class="move-to-trash" onclick="trashAlert()">Move to Trash</button>
    </form>
</div>

<section data-bs-version="5.1" class="footer3 cid-ucPZPdWPvf" once="footers" id="footer-6-ucPZPdWPvf">
    <div class="container">
        <div class="row">
            <div class="row-links">
                <ul class="header-menu">
                    <li class="header-menu-item mbr-fonts-style display-5">
                        <a href="#" class="text-white">Accueil</a>
                    </li>
                    <li class="header-menu-item mbr-fonts-style display-5">
                        <a href="#" class="text-white">Services</a>
                    </li>
                    <li class="header-menu-item mbr-fonts-style display-5">
                        <a href="#" class="text-white">À Propos</a>
                    </li>
                    <li class="header-menu-item mbr-fonts-style display-5">
                        <a href="#" class="text-white">Contact</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 mt-4">
                <p class="mbr-fonts-style copyright display-7">© 2024 DocUnity. Tous droits réservés.</p>
            </div>
        </div>
    </div>
</section>

<script src="assets/web/assets/jquery/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/parallax/jarallax.js"></script>
<script src="assets/smoothscroll/smooth-scroll.js"></script>
<script src="assets/ytplayer/index.js"></script>
<script src="assets/dropdown/js/navbar-dropdown.js"></script>
<script src="assets/embla/embla.min.js"></script>
<script src="assets/embla/script.js"></script>
<script src="assets/masonry/masonry.pkgd.min.js"></script>
<script src="assets/imagesloaded/imagesloaded.pkgd.min.js"></script>
<script src="assets/theme/js/script.js"></script>
<script src="assets/formoid/formoid.min.js"></script>
</body>
</html>