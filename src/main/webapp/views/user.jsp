<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
  <meta name="description" content="DocUnity est un syst�me d'information documentaire r�volutionnaire qui simplifie la gestion de vos documents. D�couvrez comment DocUnity peut am�liorer votre flux de travail d�s aujourd'hui!">
  <title>Gestion Documentaire Simplifi�e</title>
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
                     </li>
					 
					</ul>
				
				
			</div>
		</div>
	</nav>
</section>


<section data-bs-version="5.1" class="header16 cid-ucPZPdSHLp mbr-fullscreen mbr-parallax-background" id="hero-17-ucPZPdSHLp">
    <div class="container-fluid">
      <div class="row">
        <div class="content-wrap col-12 col-md-12">
          <div class="container">
          </div>
          <div class="row justify-content-center">
            <div class="col-lg-8 mx-auto mbr-form" data-form-type="formoid">
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>

             <!--    <div class="col-lg-12 col-md-12 col-sm-12 align-center mbr-section-btn">
                   <form action="getallfilesbyuser.do" method="post">
                    <button type="submit" class="btn btn-success display-7" href="rechercheruser1.jsp">Afficher tous vos documents</button>
                  </div>
                 </form> -->
                <form action="searchfilesbyuser.do" method="get" class="mbr-form form-with-styler" data-form-title="Form Name">
                    <br>
                    <br>
                    <br>
                    <div class="dragArea row">
                      <div class="col-md-6 col-sm-12 form-group mb-3" data-for="theme-ou-titre">
                        <label for="theme-ou-titre" style="color: white;">Th�me ou Titre</label>
                        <input type="text" name="theme-ou-titre" placeholder="Th�me ou Titre" data-form-field="Th�me ou Titre" class="form-control" value="" id="theme-ou-titre">
                      </div>
                      <div class="col-md-6 col-sm-12 form-group mb-3" data-for="type">
                        <label for="type" style="color: white;">Type</label>
                        <input type="text" name="type" placeholder="Type" data-form-field="Type" class="form-control" value="" id="type">
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 align-center mbr-section-btn">
                        <button type="submit" class="btn btn-success display-7">Chercher dans vos documents</button>
                      </div>
                    </div>
                  </form>
                  
                  






              <form action="upload.do" method="get" class="mbr-form form-with-styler" data-form-title="Form Name">
               
                <br>
                <br>
                <br>
                <div class="dragArea row flex-column">
                  
                 
                  <div class="col-md-12 col-sm-12 form-group mb-3" data-for="file-user">
                    <label for="file-user" style="color: white;">File User</label>
                    <input type="text" name="file-user" placeholder="File User" data-form-field="File User" class="form-control" value="" id="file-user">
                  </div>
                  <div class="col-md-12 col-sm-12 form-group mb-3" data-for="file-description">
                    <label for="file-description" style="color: white;">File Description</label>
                    <textarea name="file-description" placeholder="File Description" data-form-field="File Description" class="form-control" id="file-description" rows="4"></textarea>
                  </div>
                  <div class="col-md-12 col-sm-12 form-group mb-3" data-for="file-path">
                    <label for="file-path" style="color: white;">File Path</label>
                    <input type="text" name="file-path" placeholder="File Path" data-form-field="File Path" class="form-control" value="" id="file-path">
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12 align-center mbr-section-btn">
                    <button type="submit" class="btn btn-success display-7">Ajouter</button>
                  </div>
                </div>
              </form>





              <form action="deletefile.do" method="get" class="mbr-form form-with-styler" data-form-title="Form Name">
                
                <div class="dragArea row flex-column">
                  <div class="col-md-12 col-sm-12 form-group mb-3" data-for="file-name">
                    <label for="file-name" style="color: white;">File Name</label>
                    <input type="text" name="file-name" placeholder="File Name" data-form-field="File Name" class="form-control" value="" id="file-name">
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12 align-center mbr-section-btn">
                    <button type="submit" class="btn btn-danger display-7">Supprimer</button>
                  </div>
                </div>
              </form>








        
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
                    <a href="#" class="text-white">� Propos</a>
                  </li><li class="header-menu-item mbr-fonts-style display-5">
                    <a href="#" class="text-white">Contact</a>
                  </li></ul>
              </div>

            
            <div class="col-12 mt-4">
                <p class="mbr-fonts-style copyright display-7">� 2024 DocUnity. Tous droits r�serv�s.</p>
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