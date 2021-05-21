<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Veterinaria admin<sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
			<c:if test="${sessionScope.objUsuario.idrol.idrol!=1}">
				<li class="nav-item active">
	                <a class="nav-link" href="verInicioAdmin">
	                    <i class="fas fa-fw fa-tachometer-alt"></i>
	                    <span>Inicio</span></a>
	            </li>			
			</c:if>
			
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Opciones
            </div>

            
            <c:forEach items="${sessionScope.objMenus}" var="item">
            	<li class="nav-item">
	                <a class="nav-link" href="${item.ruta}">
	                    <i class="fas ${item.icono}"></i>
	                    <span>${item.nombre}</span>
                    </a>
	            </li>
            </c:forEach>
            
<!-- 
            <li class="nav-item">
                <a class="nav-link" href="verTablesConsultas">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Registro Consultas</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="verTablesIncidencias">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Registro Incidencias</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="verTablesVendedor">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Atencion de pedidos</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="tableProductos.jsp"  data-toggle="collapse" data-target="#multiCollapseExample1" aria-expanded="false" aria-controls="multiCollapseExample1">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Administracion</span></a>
                    <div class="collapse" id="multiCollapseExample1">
				      	<ul class="sub-menu" style="display: block;">
		                   <li class="nav-item"><a class="nav-link"  href="verCrudProductos"><i class="fa fa-fw fa-table"></i>Productos</a></li>
		                   <li class="nav-item"><a class="nav-link"  href="verCrudServicios"><i class="fa fa-fw fa-table"></i>Servicios</a></li>
		                   <li class="nav-item"><a class="nav-link"  href="verCrudTrabajadores"><i class="fa fa-users"></i>Personal de Trabajo</a></li>
		                   <li class="nav-item"><a class="nav-link"  href="verCrudClientes"><i class="fa fa-user"></i>Clientes</a></li>
		                   <li class="nav-item"><a class="nav-link"  href="verCrudMascotas"><i class="fa fa-fw fa-table"></i>Mascotas</a></li>
		                </ul>
				    </div>
            </li>
             -->

            <!-- Divider -->
			<hr class="sidebar-divider my-0">
			<li class="nav-item active">
                <a class="nav-link active" href="/">
                    <i class="fa fa-shopping-bag"></i>
                    <span>Ir a Tienda Online</span></a>
            </li>

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>