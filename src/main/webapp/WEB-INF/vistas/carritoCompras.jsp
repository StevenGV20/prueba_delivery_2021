<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <c:if test="${sessionScope.objUsuario.idrol.idrol==null}">
    	<c:redirect url="/"/>
    </c:if>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Carrito de compras</title>
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
        <link href="css/css_carrito.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/popper.min.js"></script>
    <link rel="stylesheet" href="css/sweetalert2.min.css">
      
<style>
	.product-item .product-price .btn{
		color:white;
	}	
	.product-item .product-title .ratting i{
		color:yellow;
	}
	.nav{
		height:50px
	}
	.nav-link:hover{
		background-color:white;
	}
	.nav .dropdown-item{
		color:white;
	}
	.nav .dropdown-item:hover{
		color:black;
	}
	.img_card{
   		width:100%;
   		height:400px;
   	}
   	#dropdown01:hover{
   		color:black;
   	}
     
</style>
    </head>

    <body>
         <!-- Top bar Start -->
		<div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="/" class="nav-item nav-link">INICIO</a>
                            <a href="verListaProductos" class="nav-item nav-link">Productos</a>
                            <a href="verListaServicios" class="nav-item nav-link">Servicios</a>
	                       	<a href="verRegistroConsultas" class="nav-item nav-link">Consultas</a>
	                            <c:if test="${sessionScope.objUsuario.idrol.idrol==1}">
		                            <a href="verTracking" class="nav-item nav-link">Mis Ordenes</a>
		                            <a href="verMisMascotas?cod=${objUsuario.idusuario}" class="nav-item nav-link">Mis Mascotas</a>
		                            <a href="verRegistroIncidencia" class="nav-item nav-link">Incidencias</a>
		                            <a href="verRegistroPedido" class="nav-item nav-link">Pedidos Mayoristas</a>
	                            </c:if>
                            <!-- <div class="nav-item dropdown">
                            <a href="verCarrito" class="nav-item nav-link">Mi Carrito</a>
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Mis Ordenes</a>
                                <div class="dropdown-menu">
                                    <a href="wishlist.html" class="dropdown-item">Wishlist</a>
                                    <a href="login.html" class="dropdown-item">Inciar Sesion</a>
                                    <a href="contact.html" class="dropdown-item">Contact Us</a>
                                </div>
                            </div> -->
                        </div>
                        
                        <div class="navbar-nav ml-auto">
                       			<c:if test="${sessionScope.objUsuario==null}">
                                    <a href="verRegistroCliente" class="nav-item nav-link">Registrarse</a>
                                    <a href="verLogin" class="nav-item nav-link">Iniciar Sesion</a>
                                </c:if>
	                            <c:if test="${sessionScope.objUsuario!=null}">
                              		 <div class="nav-item text-light">${sessionScope.objUsuario.nombre} ${sessionScope.objUsuario.apellido}</div>
                              		 <div class="nav-item dropdown">
		                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Mi cuenta</a>
		                                <div class="dropdown-menu">
		                                    <c:if test="${sessionScope.objUsuario!=null}">
		                                   		<a href="verInicioAdmin" class="dropdown-item">Ir a Administracion</a>
		                                    <a href="verLogin" class="dropdown-item">Mi Perfil</a>
		                                   		<a href="logout" class="dropdown-item">Cerrar Session</a>
		                                    </c:if>
		                               	</div>
                            		</div>
                                </c:if>
                             
                            
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Nav Bar End -->      
        
        
        <!-- Bottom Bar End -->
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">Cart</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Cart Start -->
        <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="cart-page-inner">
                            <div class="table-responsive" id="carrito">
                            	<div class="block text-left">
	                                <div class="col-md-4">
	                                    <label>Cliente:</label>
	                                    <input class="form-control" type="text" id="idCliente" placeholder="Correo" value="${objUsuario.nombre} ${objUsuario.apellido}" name="correo"/>
	                                </div>
	                                <div class="col-md-4">
	                                    <label>Correo:</label>
	                                    <input class="form-control" type="text" id="idCorreo" placeholder="Correo" value="${objUsuario.correo}" name="correo"/>
	                                </div>
                                </div>
                                <table class="table table-bordered"  id="lista-compra">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Producto</th>
                                            <th>Precio</th>
                                            <th>Cantidad</th>
                                            <th>Total</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle"">
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-page-inner">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="cart-summary">
                                        <div class="cart-content">
                                            <h1>Cart Summary</h1>
                                            <p>Importe: <span id="idImporte"></span></p>
                                            <p>Descuento<span id="idDescuento"></span></p>
                                            <p>IGV:<span id="idIGV"></span></p>
                                            <h2>Monto Total: <span id="idTotal"></span></h2>
                                        </div>
                                        <div class="cart-btn">
                                            <a href="/" class="btn border">Continuar Comprando</a>
                                            <button id="procesar-compra">Pagar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->
        
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
        
	    <script src="js/sweetalert2.min.js"></script>
	    
        <script type="text/javascript" src="js/carrito_js.js"></script>
        <script type="text/javascript" src="js/compra.js"></script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
