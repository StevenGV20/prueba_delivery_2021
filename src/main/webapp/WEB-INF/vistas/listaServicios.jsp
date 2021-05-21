<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Nuestros Servicios</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

		<!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style_theme_blue.css" rel="stylesheet">
		
    </head>

    <body>
         <!-- Top bar Start -->
		<jsp:include page="menuCliente.jsp"></jsp:include>
        <!-- Nav Bar End -->      
          
        <div class="container">
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Inicio</a></li>
                    <li class="breadcrumb-item"><a href="verListaServicios">Servicios</a></li>
                    <li class="breadcrumb-item active">Lista de Servicios</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Product List Start -->
        <div class="product-view">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-view-top">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="product-search">
                                                <input type="text" id="filtroBuscar" placeholder="Ingrese un nombre">
                                                <button><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                        <div class="col-md-8 float-right">
                                            <div class="product-price-range">
                                                <div class="dropdown">
                                                    <select class="dropdown-toggle col-md-6 float-right" id="idFiltro">
                                                    	<option value="0">Filtrar Por:</option>
                                                		<option value="1">Nombre (A - Z)</option>
                                                		<option value="2">Nombre (Z - A)</option>
                                                    	<option value="3">Preico de menor a mayor</option>
                                                    	<option value="4">Precio de mayor a menor</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="idTotalProductos" class="mb-3"></div>
                            <div id="listaServicios" class="row col-md-12">
	                        </div>
                        </div>
                        
                        <!-- Pagination Start -->
                        <div class="col-md-12">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Pagination Start -->
                    </div>           
                    
                    <!-- Side Bar Start -->
                    
                    <!-- Side Bar End -->
                </div>
            </div>
        </div>
       </div>
        <!-- Product List End -->  
        
        <!-- Brand Start -->
        <div class="brand">
            <div class="container-fluid">
                <div class="brand-slider">
                    <div class="brand-item"><img src="img/brand-1.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-2.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-3.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-4.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-5.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-6.png" alt=""></div>
                </div>
            </div>
        </div>
        <!-- Brand End -->
        
        <!-- Footer Start -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Get in Touch</h2>
                            <div class="contact-info">
                                <p><i class="fa fa-map-marker"></i>123 E Store, Los Angeles, USA</p>
                                <p><i class="fa fa-envelope"></i>email@example.com</p>
                                <p><i class="fa fa-phone"></i>+123-456-7890</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Follow Us</h2>
                            <div class="contact-info">
                                <div class="social">
                                    <a href=""><i class="fab fa-twitter"></i></a>
                                    <a href=""><i class="fab fa-facebook-f"></i></a>
                                    <a href=""><i class="fab fa-linkedin-in"></i></a>
                                    <a href=""><i class="fab fa-instagram"></i></a>
                                    <a href=""><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Company Info</h2>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Terms & Condition</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Purchase Info</h2>
                            <ul>
                                <li><a href="#">Pyament Policy</a></li>
                                <li><a href="#">Shipping Policy</a></li>
                                <li><a href="#">Return Policy</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="row payment align-items-center">
                    <div class="col-md-6">
                        <div class="payment-method">
                            <h2>We Accept:</h2>
                            <img src="img/payment-method.png" alt="Payment Method" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="payment-security">
                            <h2>Secured By:</h2>
                            <img src="img/godaddy.svg" alt="Payment Security" />
                            <img src="img/norton.svg" alt="Payment Security" />
                            <img src="img/ssl.svg" alt="Payment Security" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        
        <!-- Footer Bottom Start -->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 copyright">
                        <p>Copyright &copy; <a href="https://htmlcodex.com">HTML Codex</a>. All Rights Reserved</p>
                    </div>

                    <div class="col-md-6 template-by">
                        <p>Template By <a href="https://htmlcodex.com">HTML Codex</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Bottom End -->       
        
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script type="text/javascript" src="js/carrito_js.js"></script>
        <script type="text/javascript" src="js/verCarrito.js"></script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        
    <script type="text/javascript">
	    function listarServicios(url){
	    	$.getJSON(url,{},function(lista, q, t){
	    		console.log(lista);
	    		$("#listaServicios").empty();
	    		//var detalles="<button type='button' class='btn btn-info' id='btnDetalles' data-toggle='modal'  data-target='#idModalFoto'>Subir Foto</button>";
	    		$.each(lista,function(index,item){
	    			$("#listaServicios").append("<div class='col-md-4'> "
	    					+ "	<div class='product-item'> "
	    					+ "		<div class='product-title'> "
	    					+ "			<a href='verDetalleServicio?id="+item.idservicio+"'>"+item.nombre+"</a> "
	    					+ "			<div class='ratting'> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "			</div> "
	    					+ "		</div> "
	    					+ "		<div class='product-image'> "
	    					+ "			<a href='verDetalleServicio?id="+item.idservicio+"'> "
	    					+ "				<img src='img/"+item.foto+"' class='img_card' alt='Product Image'> "
	    					+ "			</a> "
	    					+ "			<div class='product-action'> "
	    					+ "				<a href='verDetalleServicio?id="+item.idservicio+"'><i class='fa fa-search'></i></a> "
	    					+ "			</div> "
	    					+ "		</div> "
	    					+ "		<div class='product-price'> "
	    					+ "			<h3><span>S/. </span>"+item.precio+"</h3> "
	    					+ "			<a class='btn' href='verDetalleServicio?id="+item.idservicio+"'><i class='fa fa-shopping-cart'></i>Solicitar</a> "
	    					+ "		</div> "
	    					+ "	</div> "
	    					+ "</div>");
	    		})
	    		//$("#tbServicios img").css("width","100%");
	        })
	    	
	    }
	    
	    function listaServiciosByName(nom){
	    	$.getJSON("listaServiciosByName",{nombre:nom},function(lista, q, t){
	    		console.log(lista);
	    		$("#listaServicios").empty();
	    		if(nom.trim().length>0)
	    			$("#idTotalProductos").html("<h6>Resultados de búsqueda para '"+nom+"'</h6>");
	    		else
	    			$("#idTotalProductos").empty();
	    		//var detalles="<button type='button' class='btn btn-info' id='btnDetalles' data-toggle='modal'  data-target='#idModalFoto'>Subir Foto</button>";
	    		$.each(lista,function(index,item){
	    			$("#listaServicios").append("<div class='col-md-4'> "
	    					+ "	<div class='product-item'> "
	    					+ "		<div class='product-title'> "
	    					+ "			<a href='verDetalleServicio?id="+item.idservicio+"'>"+item.nombre+"</a> "
	    					+ "			<div class='ratting'> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "				<i class='fa fa-star'></i> "
	    					+ "			</div> "
	    					+ "		</div> "
	    					+ "		<div class='product-image'> "
	    					+ "			<a href='verDetalleServicio?id="+item.idservicio+"'> "
	    					+ "				<img src='img/"+item.foto+"' class='img_card' alt='Product Image'> "
	    					+ "			</a> "
	    					+ "			<div class='product-action'> "
	    					+ "				<a href='verDetalleServicio?id="+item.idservicio+"'><i class='fa fa-search'></i></a> "
	    					+ "			</div> "
	    					+ "		</div> "
	    					+ "		<div class='product-price'> "
	    					+ "			<h3><span>S/. </span>"+item.precio+"</h3> "
	    					+ "			<a class='btn' href='verDetalleServicio?id="+item.idservicio+"'><i class='fa fa-shopping-cart'></i>Solicitar</a> "
	    					+ "		</div> "
	    					+ "	</div> "
	    					+ "</div>");
	    		})
	    		//$("#tbServicios img").css("width","100%");
	        })
	    	
	    }
		
	    $(document).ready(function(){
	    	listarServicios("listaServicios");
	    	
	    	$("#filtroBuscar").keyup(function(){
	    		listaServiciosByName($(this).val().trim());
	    	});
	    	
	    	
	    	$("#idFiltro").change(function(){
	    		if($(this).val()==1)
	    			listarServicios("listaServiciosByNameAZ");	    			
	    		else if($(this).val()==2)
	    			listarServicios("listaServiciosByNameZA");
	    		else if($(this).val()==3)
	    			listarServicios("listaServiciosByPrecioMenor");	    			
	    		else if($(this).val()==4)
	    			listarServicios("listaServiciosByPrecioMayor");
	    		/*else
	    			listarProductos("listaProductos");*/
	    	});	
	    });
    
    
    </script>
        
        
    </body>
</html>
