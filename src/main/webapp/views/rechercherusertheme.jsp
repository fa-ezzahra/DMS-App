<%@page import="com.jee.beans.DocumentJ"%>
<%@page import="java.util.List"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html >
<head>
  <!-- Site made with Mobirise Online Website Builder v5.9.13, https://a.mobirise.com -->
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
 
  
  
</head>
<body>

 
  
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
                      <span class="nav-link text-black display-7"><%= session.getAttribute("userName") %></span>
                     </li></ul>
				
				
			</div>
		</div>
	</nav>

</section>


<section data-bs-version="5.1" class="header10 cid-ucPZPdSHLp mbr-fullscreen mbr-parallax-background" id="hero-50-ucPZPdSHLp">
  <div class="container-fluid">
    <div class="row">
      <div class="content-wrap col-60 col-md-60">
        <h1 class="mbr-section-title mbr-fonts-style mbr-white mb-4 display-1">
          <strong>  Liste des documents</strong>
        </h1>
        <div class="container"></div>
        <div class="row justify-content-center">
          <div class="col-lg-8 mx-auto mbr-form" data-form-type="formoid">
          <% List<DocumentJ> files =(List<DocumentJ>)request.getAttribute("files"); %>
          
           <!--  <form> -->
              <div class="table-responsive">
                <table class="table table-striped rounded-lg custom-table" style="background-color: white; border-radius: 20px;">
                  <thead>
                    <tr>
                      <th scope="col">File Name</th>
                      <th scope="col">File Type</th>
                      <th scope="col">File Size</th>
                      <th scope="col">File User</th>
                      <th scope="col" style="width: 30%;">File Description</th>
                      <th scope="col">Path</th>
                      <th scope="col" style="width: 15%;">Download</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- Exemple de document stocké -->
                   <% for (int i = 0; i < files.size(); i++) { %>
                    <tr>
                      <td><input type="text" name="file-name" class="form-control-plaintext" readonly value="<%= files.get(i).getFileName() %>"></td>
                      <td><input type="text" name="file-type" class="form-control-plaintext" readonly value="<%= files.get(i).getFileType() %>"></td>
                      <td><input type="text" name="file-size" class="form-control-plaintext" readonly value="<%= files.get(i).getFileSize() %>"></td>
                      <td><input type="text" name="file-user" class="form-control-plaintext" readonly value="<%= files.get(i).getFileUser() %>"></td>
                      <td><input type="text" name="file-description" class="form-control-plaintext" readonly value="<%= files.get(i).getFileDescp() %>"></td>
                      <td><input type="text" name="path" class="form-control-plaintext" readonly value="<%= files.get(i).getFilePath() %>"></td>
                      <td>
                        <form action="downloadDoc.do" method="get">
                          <input type="hidden" name="filePath" value="<%= files.get(i).getFilePath() %>">
                          <button type="submit" class="btn btn-lg btn-success">&#8595;</button>
                       </form>
                     </td>
                  </tr>
                 <% } %>

                    <!-- Ajouter d'autres lignes pour chaque document stocké -->
                  </tbody>
                </table>
              </div>
           <!--  </form> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
  
  





<section data-bs-version="5.1" class="footer3 cid-ucPZPdWPvf" once="footers" id="footer-6-ucPZPdWPvf">

        

    

    <div class="container">
        <div class="row">
            <div class="row-links">
                <ul class="header-menu">
                  
                  
                  
                  
                <li class="header-menu-item mbr-fonts-style display-5">
                    <a href="#" class="text-white">Accueil</a>
                  </li><li class="header-menu-item mbr-fonts-style display-5">
                    <a href="#" class="text-white">Services</a>
                  </li><li class="header-menu-item mbr-fonts-style display-5">
                    <a href="#" class="text-white">À Propos</a>
                  </li><li class="header-menu-item mbr-fonts-style display-5">
                    <a href="#" class="text-white">Contact</a>
                  </li></ul>
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
  <style>
    .custom-table {
      max-width: 1800px; /* Largeur maximale du tableau */
      margin: 0 auto; /* Centre le tableau horizontalement */
    }
  </style>
  
  
</body>
</html>