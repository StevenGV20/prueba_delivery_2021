<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
                            <a href="verDetalleProducto" class="nav-item nav-link">Detalle Producto</a>
                            <a href="verCarrito" class="nav-item nav-link">Mi Carrito</a>
                            <a href="verTracking" class="nav-item nav-link">Mis Ordenes</a>
                            <a href="verCrudMascotas" class="nav-item nav-link">Mis Mascotas</a>
                            <!-- <div class="nav-item dropdown">
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
	                                    <a href="verRegistroDeCliente" class="nav-item nav-link">Registrarse</a>
	                                </c:if>
	                            <c:if test="${sessionScope.objUsuario!=null}">
                               		 <div class="nav-item text-light">${sessionScope.objUsuario.nombre} ${sessionScope.objUsuario.apellido}</div>
                                </c:if>
                             
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Mi cuenta</a>
                                <div class="dropdown-menu">
	                                <c:if test="${sessionScope.objUsuario==null}">
	                                    <a href="verLogin" class="dropdown-item">Iniciar Sesion</a>
                                    	<a href="verRegistroDeCliente" class="dropdown-item">Registrarse</a>
	                                </c:if>
                                    <c:if test="${sessionScope.objUsuario!=null}">
                                   		<a href="verInicioAdmin" class="dropdown-item">Ir a Administracion</a>
                                    <a href="verLogin" class="dropdown-item">Mi Perfil</a>
                                   		<a href="logout" class="dropdown-item">Cerrar Session</a>
                                    </c:if>
                                </div>
                            </div>
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
                    <div class="col-md-3">
                        <div class="user">
                            <a href="listaProductos.jsp" class="btn wishlist">
                                <i class="fa fa-heart"></i>
                                <span>(0)</span>
                            </a>
                            <a href="carritoCompras.jsp" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>(0)</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>