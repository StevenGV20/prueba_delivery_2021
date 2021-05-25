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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Vendedor Admin - Atencion Pedidos</title>
    
    <link rel="stylesheet" href="./css/reset.css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
	<link rel="stylesheet" href="./css/main.css">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600|Open+Sans" rel="stylesheet"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
	<link rel="stylesheet" href="css/estilos.css">

        <link href="css/layout.css" rel="stylesheet" type="text/css" media="all">
    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
    <!-- CSS only -->

<style>
  	.forms input{
  		margin-bottom: 0px;
  	}
  	.forms select{
  		margin-bottom: 0px;
  	}
  	.forms fieldset{
  		margin-top: 10px;
  		display: flex;
  		flex-direction: column; 
  	}
  	section.forms{
  		margin-top:30px;
  		margin-bottom:10px;
  	}
  	.forms h2{
  		margin-bottom:0px;
  	}
  	small{
  		color:red;
  		margin-bottom: 10px;
  	}
  	.modal-lg{
  		width: 80%;
  	}
  </style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="slidebar.jsp"></jsp:include>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="navbar.jsp"></jsp:include>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid ">

                    <div class="content"> 
	              <header  class="marcos1 col-md-12 row">
	              	<div class="col-md-9">
			          <h6>Revisar Tracking de mi pedido</span></h6>
			       	  <label for="name" style="font-size: 20px">Número de Orden de Pedido :  <span>${requestScope.tracking.pedido.idpedido}</span></label>
			          <input class="btmspace-15" type="text" value="${requestScope.tracking.pedido.idpedido}" hidden="" placeholder="Ingrese Numero">	              	
	              	</div>
	              	<c:if test="${sessionScope.objUsuario.idrol.idrol>1}">
		              	<c:if test="${requestScope.tracking.estado!='ENTREGADO'}">
		              		<div class="col-md-3 row mt-5">
			              		<form action="registraEntrega" class="row">
			              			<input class="btmspace-15" type="text" value="${requestScope.tracking.idtracking}" hidden="" name="idtracking">	
			              			<input class="btmspace-15" type="text" value="${requestScope.tracking.pedido.idpedido}" hidden="" name="pedido.idpedido">	
			              			<input class="btmspace-15" type="text" value="${requestScope.tracking.pedido.cliente.direccion}" hidden="" name="destino">	
			              			<input class="btmspace-15" type="text" value="${requestScope.tracking.trabajador.idusuario}" hidden="" name="trabajador.idusuario">
				              		<h6 class="mt-3">Registrar Entrega: </h6>
				              		<button type="submit" class="btn btn-succes ml-4">Entregado</button>	              		
			              		</form>
			              	</div>
		              	</c:if>	              	
	              	</c:if>
	              	
			        </header>
	        <br><br>
	     
	       <div class="scrollable">
	        <table>
	          <thead>
	            <tr>
	              <th>Fecha de Registro</th>
	              <th>Fecha de Entrega</th>
	              <th>Origen</th>
	              <th>Destino</th>
	            </tr>
	          </thead>
	       <tbody>
	            <tr>
	              <td>${requestScope.tracking.pedido.fechaRegistro}</td>        
	              <td>PENDIENTE</td>  
	              <td>Veterinaria</td>  
	              <td>${requestScope.tracking.pedido.cliente.direccion}</td>    
	            </tr>
	          
	          </tbody>
	        </table> <br><br>
	      </div>
	      
	       
	      
	    <div class="col-md-12 row">
	      <h6 class="col-md-12">Hoja de Tracking</h6>
	      <div class="col-md-4 text-center">
		          <c:if test="${requestScope.tracking.estado=='PENDIENTE'}">
			          <div class="first">
			            <h2>Registrado</h2>
			            <img alt="" src="img/entregado.jpg">
			            <h5>Pedido registrado y en proceso de ser Atendido.</h5>
			          </div>	          
		          </c:if>
		          
		          <c:if test="${requestScope.tracking.estado=='EN CAMINO'}">
			          <div class="">
			            <h2>En Ruta</h2>
			             <img alt="" src="img/ruta.jpg">
			              <h5>Pedido En Ruta</h5>
			          </div>
		          </c:if>
		          <c:if test="${requestScope.tracking.estado=='ENTREGADO'}">
			          <div class="">
			            <h2>Entregado</h2>
			             <img alt="" src="img/recibidop.jpg"> <br><br><br>
			              <h5>Entrega Satisfactoria</h5>
			          </div>
		          </c:if>  
	      
	      </div>
	      
	      <div class="scrollable col-md-8 mt-5">
	        <table>
	          <thead>
	            <tr>
	              <th>Fecha/Hora de Modificacion</th>
	              <th>Realizador por:</th>
	              <th>Estado</th>
	              <th>Motivo</th>
	            </tr>
	          </thead>
	          <tbody>
	          	<c:forEach items="${requestScope.historial}" var="item">
		            <tr>
		              <td>${item.fechaModificacion}</td>
		              <td>${item.usuario.idrol.nombre}: ${item.usuario.nombre} ${item.usuario.apellido}</td>
		              <td>${item.estado}</td>
		              <td></td>
		            </tr>	          	
	          	</c:forEach>
	            
	          </tbody>
	        </table>
	        
	      </div>
	      </div>
	
	      </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
         
<div class="modal fade bd-example-modal-lg" id="nuevo"  data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
 		 <section class="forms ml-4 mr-4 m-4">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12">
                    <div class="section-heading">
                      <h2>Detalle del Pedido</h2>
                    </div>
                    <form  method="post" action="" id="idRegistrar" data-toggle="validator" class="mt-3 form-horizontal">
                      	 <div class="cart-page">
					            <div class="container-fluid">
					                <div class="row">
					                    <div class="col-lg-8">
					                        <table class="table table-bordered table-striped"  id="detallePedido">
					                                    <thead class="thead-dark">
					                                        <tr>
					                                            <th>Producto</th>
					                                            <th>Precio</th>
					                                            <th>Cantidad</th>
					                                            <th>Total</th>
					                                        </tr>
					                                    </thead>
					                                    <tbody class="align-middle"">
					                                       
					                                    </tbody>
					                                </table>
					                    </div>
					                    <div class="col-lg-4">
					                        <div class="cart-page-inner">
					                            <div class="row">
					                                <div class="col-md-12">
					                                    <div class="cart-summary">
					                                    	<table class="table">
					                                    		<thead><tr><td><h2>Totales</h2></td><td></td></tr></thead>
						                                    	<tbody class="text-right">
						                                    		<tr><td class="text-left"><p>Importe:</p></td><td>S/. <span id="idImporte"></span></td></tr>
						                                    		<tr><td class="text-left"><p>Descuento:</p></td><td>S/. <span id="idDescuento"></span></td></tr>
						                                    		<tr><td class="text-left"><p>IGV:</p></td><td>S/. <span id="idIGV"></span></td></tr>
						                                    		<tr><td class="text-left"><h5>Monto Total:</h5></td><td><h5>S/. <span id="idTotal"></span></h5></td></tr>
						                                    	</tbody>
					                                    	</table>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
                      	
                      	
                       <br>
                        <div class="col-md-12 mt-2">
                          <button type="button" class="btn__submit" id="btnCancelar" data-dismiss="modal">Cancelar</button>  		
        				  <button type="button" onclick="window.location='verTracking'" class="btn__reset" id="btnTracking" >Ver Tracking</button>
                        </div>
                        
                    </form>
                  </div>
                </div>
              </div>
            </section>
      
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg" id="eliminar"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Atendiendo Pedidos</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
        <div class="col-md-12">
        	<div class="row">
                        <div class="col-md-6">
                          <fieldset class="form-group">
                          <label for="staticEmail">Ingresar Nombre del agente</label>
							<input type="text" class="input"  name="prueba" id="idnomprue">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset class="form-group">	
                          <label for="staticEmail">Ingresar cotizacion para el cliente</label>
							<input type="text" class="input"  name="prueba2" id="idregprue" >
                          </fieldset>
                        </div>    
                      </div>
                      </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="" method="post" name="formDelete" id="id_form_elimina">	
		  	  <input type="hidden" id="idEliminar" name="id">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	          <button type="button" id="btn_eliminar" data-dismiss="modal" class="btn btn-primary">Responder</button>
            </form>
        </div>
        
    </div>
  </div>
</div>

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Maqueta V.01 &copy; Pagina echa 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/transition.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/custom.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
    	<script src="js/global.js"></script>
    <script src="popup.js"></script>
   <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
    
    <script type="text/javascript">  


$(document).on("click","#verPedido",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	//alert(cod);
	$.getJSON("detallePedidoById",{id:cod},function(listar, q, t){
		$("#detallePedido tbody").empty();
		console.log(listar);
		$.each(listar,function(index,item){
			$("#detallePedido tbody").append("<tr><td>"+item.producto.idproducto+"</td><td>"+item.producto.nombre+"</td><td>"+item.cantidad+"</td><td>"+item.precioTotal+"</td></tr>");
			if(item.montoTotal>0){
				//alert(item.montoTotal);
				$("#idImporte").text(parseFloat(item.importe).toFixed(2));
				$("#idIGV").text((item.igv).toFixed(2));
				$("#idDescuento").text((item.descuento).toFixed(2));
				$("#idTotal").text((item.montoTotal).toFixed(2));
			}
		})
	})
	
	//bloquear(false);
}));


$(document).on("click","#btnEliminar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#idEliminar").val(cod);
}));

function limpiarFormConsulta(){
	//bloquear(false);
	$("#idRegistrar").trigger("reset");
	$("#idRegistrar").data("bootstrapValidator").resetForm(true);
	$("#idCodigo").val("0");
}

//LISTAR CLIENTES/USUARIOS
function listarTablas(){
	$('#tbPedido tbody').append('<tr><td class="loading text-center mb-5" colspan="10"><img src="img/cargando.gif" width="10%" alt="loading" /><br/>Un momento, por favor...</td> </tr>');
	$.getJSON("listaPedido2",{},function(listar, q, t){
		console.log(listar);
		
		var editar="<button type='button' class='btn btn-success' id='btnEditar' data-toggle='modal'  data-target='#nuevo'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#eliminar' id='btnEliminar'>RESPONDER</button>";

		$("#tbPedido tbody").empty();
		$.each(listar,function(index,item){
			$("#tbPedido tbody").append("<tr><td>"+item.idpedido+"</td><td>"+item.nombre+"</td><td>"+item.regPedido+"</td><td>"+item.fechaPedido+
					"</td><td>"+eliminar+"</td></tr>");
		})
		  $("#tbPedido").DataTable();
    })
	
}


$(document).ready( function () {

	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
    
    //alert("Hola");
    //listarTablas();
    $("#tbPedido").DataTable();
    
    /*$("#btnCancelar").click(function(){
		//alert("hola");
		//bloquear(false);
    	$("#idRegistrar").trigger("reset");
		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		$("#idRegistrar select").val("[ Seleccione ]");
    });
    */
		    
});
    
    
   
 </script> 


</body>

</html>