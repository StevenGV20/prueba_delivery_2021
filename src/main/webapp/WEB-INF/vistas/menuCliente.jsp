<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/popper.min.js"></script>
    <link rel="stylesheet" href="css/sweetalert2.min.css">
    <link rel="stylesheet" href="css/css_carrito.css">
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
   		height:350px;
   	}
   	#dropdown01:hover{
   		color:black;
   	}
     form small{
        		color:red;
        	}
</style>
<!-- <div class="top-bar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <i class="fa fa-envelope"></i>
                        support@email.com
                    </div>
                    <div class="col-sm-6">
                        <i class="fa fa-phone-alt"></i>
                        +012-345-6789
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Top bar End -->
        
        <!-- Nav Bar Start -->
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
		                            <a href="verMisPedidos" class="nav-item nav-link">Mis Ordenes</a>
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
	                        <div class="nav-item dropdown mr-5">
	                            	<span class="nav-item dropdown-toggle img-fluid text-light" id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
	                                    aria-expanded="false">Mi carrito<i class="fa fa-shopping-cart"> (<span id="idCanProductos"></span>)</i></span>
	                                <div id="carrito" class="dropdown-menu" aria-labelledby="navbarCollapse">
	                                    <table id="lista-carrito" class="table alert-info">
	                                        <thead>
	                                            <tr>
	                                                <th>Imagen</th>
	                                                <th>Detalle</th>
	                                                <th></th>
	                                                <th></th>
	                                                <th></th>
	                                                <th>Total</th>
	                                                <th></th>
	                                                <th></th>
	                                            </tr>
	                                        </thead>
	                                        <tbody></tbody>
	                                    </table>
	                                    <a href="#" id="vaciar-carrito" class="btn btn-primary btn-block">Vaciar Carrito</a>   
	                                    <c:if test="${sessionScope.objUsuario==null}">
		                                   		<small class="col-md-12 text-light text-center">Para continuar Inicie Sesion o Registrese</small>
			                                    <a href="verLogin" class="btn btn-info btn-block nav-link" id="#" onclick="window.location='verLogin'">Iniciar sesion</a>
			                                    <a href="verRegistroCliente" class="btn btn-danger btn-block nav-link" id="#" onclick="window.location='verRegistroCliente'">Registrarse</a>
		                                </c:if> 
		                                <c:if test="${sessionScope.objUsuario!=null}">
	                                    	<a href="verCarrito" id="procesar-pedido" class="btn btn-danger btn-block">ProcesarCompra</a>
		                                </c:if>                        
	                                </div>
	                            </div>
                       			<c:if test="${sessionScope.objUsuario==null}">
                                    <a href="verRegistroCliente" class="nav-item nav-link">Registrarse</a>
                                    <a href="verLogin" class="nav-item nav-link">Iniciar Sesion</a>
                                </c:if>
	                            <c:if test="${sessionScope.objUsuario!=null}">
                              		 <div class="nav-item dropdown mr-5">
		                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${sessionScope.objUsuario.nombre} ${sessionScope.objUsuario.apellido}</a>
		                                <div class="dropdown-menu">
		                                    <c:if test="${sessionScope.objUsuario!=null}">
			                                    <c:if test="${sessionScope.objUsuario.idrol.idrol!=1}">
		                                   			<a href="verInicioAdmin" class="nav-link dropdown-item">Ir a Administracion</a>
											    </c:if>
											    <c:if test="${sessionScope.objUsuario.idrol.idrol==1}">
		                                   			<a href="verMisMascotas?cod=${sessionScope.objUsuario.idusuario}" class="nav-link dropdown-item">Ir a Administracion</a>
											    </c:if>
		                                   		
		                                    	<a href="verLogin" class="nav-link dropdown-item">Mi Perfil</a>
		                                   		<a href="logout" class="nav-link dropdown-item">Cerrar Session</a>
		                                    </c:if>
		                               	</div>
                            		</div>
                                </c:if>
                             
                            
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        
        
        
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="logo">
                            <a href="index.html">
                                <img src="img/logo.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="search">
                            <input type="text" placeholder="Search">
                            <button><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                    <div class="col-md-3"><!-- 
                        <div class="user">
                            <a href="verListaProductos" class="btn wishlist">
                                <i class="fa fa-heart"></i>
                                <span>(0)</span>
                            </a>
                            <a href="verCarrito" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>(0)</span>
                            </a>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        
        