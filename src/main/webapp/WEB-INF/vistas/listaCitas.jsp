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
                <div class="container-fluid text-center ">

                    <!-- Page Heading -->
                    <h1 class="h3 text-gray-800">Mis Pedidos</h1>
                    <p class="">En esta seccion podras ver todos tus pedidos realizados y consultar el estado en que se encuentran.</p>
					<input value="${sessionScope.objUsuario.idrol.idrol}" id="txtIdRol" hidden=""/>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4 col-md-9" style="margin-left: 12%;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Pedidos</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tbPedido" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Fecha de Registro</th>
                                            <th>Estado</th>
                                            <th>Servicio</th>
                                            <c:if test="${(sessionScope.objUsuario.idrol.idrol==2) or (sessionScope.objUsuario.idrol.idrol==3)}">
                                            	<th>Cliente</th>
                                            	<th></th>
                                            </c:if>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Nombre del cliente</th>
                                            <th>Estado</th>
                                            <th>Servicio</th>
                                            <c:if test="${(sessionScope.objUsuario.idrol.idrol==2) or (sessionScope.objUsuario.idrol.idrol==3)}">
                                            	<th>Cliente</th>
                                            	<th></th>
                                            </c:if>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach items="${requestScope.citas}" var="item">
                                    		<tr>
	                                        	<td>${item.idcita}</td>
	                                            <td>${item.fechaRegistro}</td>
	                                            <td>${item.estado}</td>
	                                            <td>${item.servicio.nombre}</td>
	                                            <c:if test="${sessionScope.objUsuario.idrol.idrol==2 || sessionScope.objUsuario.idrol.idrol==3}">
	                                            	<td>${item.cliente.nombre} ${item.cliente.apellido}</td>
	                                            	<c:if test="${item.estado!='PENDIENTE'}">
	                                            		<td><button data-toggle='modal' disabled="disabled"  data-target='#asignar' class="btn btn-warning" id="btnAsignar">Asignar <i class="fas fa-user-check"></i></button></td>
	                                            	</c:if>
	                                            	<c:if test="${item.estado=='PENDIENTE'}">
	                                            		<td><button data-toggle='modal'  data-target='#asignar' class="btn btn-warning" id="btnAsignar">Asignar <i class="fas fa-user-check"></i></button></td>
	                                            	</c:if>
	                                            </c:if>
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
  
<div class="modal fade bd-example-modal-lg" id="asignar"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Asignar Veterinario</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
	        <div class="col-md-12">
	        	<div class="row">
	        		<form  method="post" action="asignaVeterinario" id="idRegistrar" data-toggle="validator" enctype="multipart/form-data" class="mt-3 form-horizontal">
                      <div class="row">
                        <div class="col-md-6">
                          <fieldset class="form-group">
                         	<label for="staticEmail">Fecha de Atención:</label>
							<input class="form-control" id="idCodigoCita" name="idcita" hidden=""/>
							<input class="form-control" type="date" id="idFecAtencion" name="fechaAtencion" placeholder="Ingrese Fecha de Atención"/>
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>
							<label for="staticEmail">Hora de Atención:</label>
							<input class="form-control" type="time" id="idHoraAtencion" name="horaAtencion" placeholder="Ingrese Hora de Atención"/>
                          </fieldset>
                        </div>
                        <div class="col-md-4">
                          <fieldset>
							<label for="staticEmail">Servicio:</label>
							<input class="form-control" id="idServicio" name="servicio.idservicio" hidden=""/>
							<input class="form-control" type="text" id="idNomServicio" placeholder="Nombre del Servicio"/>
                          </fieldset>
                        </div>
                        <div class="col-md-4">
                          <fieldset>
							<label for="staticEmail">Cliente:</label>
							<input class="form-control" id="idCliente" hidden="" name="cliente.idusuario"/>
							<input class="form-control" type="text" id="idNomCliente" placeholder="Nombre del Cliente"/>
                          </fieldset>
                        </div>
                        <div class="col-md-4">
                          <fieldset>
                         	<label>Elige un Veterinario:</label>    
							<select id="idVeterinario"  class="input" name="veterinario.idusuario">	
								<option>[ Seleccione ]</option>
							</select>
						 </fieldset>
                        </div>
                        <div class="col-md-12">
                          <fieldset>
							<label for="staticEmail">Observaciones</label>
							<textarea class="form-control" id="idObservaciones" name="observacion"></textarea>
                          </fieldset>
                        </div>
                        <div class="col-md-12 mt-2">
                          <button type="submit" class="btn__submit" id="btnRegistrar">Registrar</button>  		
        				  <button type="button" class="btn__reset" id="btnCancelar" data-dismiss="modal">Cancelar</button>
                        </div>
                        
                      </div>
                    </form> 
	              </div>
	          </div>
	    </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
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
	$("#lblCodigo").text(cod);
	$("#idCodigoPedido").val(cod);
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
/*
function formatDate(timestamp) {
    console.log(timestamp);
    //console.log(timestamp.split("/")[1].replace(/\D/g, ''));
    var x = new Date(timestamp.split("-")[1].replace(/\D/g, ''));
    var dd = x.getDate();
    var mm = x.getMonth() + 1;
    var yy = x.getFullYear();
    return dd + "/" + mm + "/" + yy;
}*/

function getFormattedDate(date) {
	  var year = date.getFullYear();

	  var month = (1 + date.getMonth()).toString();
	  month = month.length > 1 ? month : '0' + month;

	  var day = date.getDate().toString();
	  day = day.length > 1 ? day : '0' + day;
	  
	  return month + '/' + day + '/' + year;
	}

function formatAMPM(date) {
	  var hours = date.getHours();
	  var minutes = date.getMinutes();
	  var ampm = hours >= 12 ? 'PM' : 'Am';
	  hours = hours % 12;
	  hours = hours ? hours : 12; // the hour '0' should be '12'
	  minutes = minutes < 10 ? '0'+minutes : minutes;
	  var strTime = hours + ':' + minutes + ' ' + ampm;
	  return strTime;
	}


$(document).on("click","#btnAsignar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	//alert(cod);
	$.getJSON("buscaCitaById",{cod:cod},function(data, q, t){
		console.log(data);
		var date = new Date(data.fechaAtencion);
		var time=new Date(data.horaAtencion);
	    //alert(((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear());
		$("#idCodigoCita").val(data.idcita);//alert(data.fechaAtencion);
		//alert(date);
		//alert(getFormattedDate(date));
		$("#idFecAtencion").val(getFormattedDate(date));
		$("#idHoraAtencion").val(formatAMPM(time));
		$("#idServicio").val(data.servicio.idservicio);
		$("#idNomServicio").val(data.servicio.nombre);
		$("#idCliente").val(data.cliente.idusuario);
		$("#idNomCliente").val(data.cliente.nombre +" "+data.cliente.apellido );
		$("#idObservaciones").val(data.observacion);
		if(data.veterinario.idusuario!=null)
			$("#idVeterinario").val(data.veterinario.idusuario);
	})
	
	//bloquear(false);
}));

function limpiarFormConsulta(){
	//bloquear(false);
	$("#idRegistrar").trigger("reset");
	$("#idRegistrar").data("bootstrapValidator").resetForm(true);
	$("#idCodigo").val("0");
}

//LISTAR CLIENTES/USUARIOS
function listarTablas(lista){
	$('#tbPedido tbody').append('<tr><td class="loading text-center mb-5" colspan="10"><img src="img/cargando.gif" width="10%" alt="loading" /><br/>Un momento, por favor...</td> </tr>');
	$.getJSON("listaPedido",{},function(listar, q, t){
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


function listaVeterinario(){
	//alert("hola");
	$.getJSON("listaUsuarioByRol",{cod:5},function(listar, q, t){
		console.log(listar);
		$.each(listar,function(index,item){
			$("#idVeterinario").append("<option value='"+item.idusuario+"'>"+item.nombre+" "+item.apellido+"</option>");
		})
	})
}


$(document).ready( function () {

	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
    
    //alert("Hola");
    //listarTablas();
    listaVeterinario();
    $("#tbPedido").DataTable();
    
    //if($("#txtIdRol")==4)
   		
    $("#btnCancelar").click(function(){
		//alert("hola");
		//bloquear(false);
    	$("#idRegistrar").trigger("reset");
		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		$("#idRegistrar select").val("[ Seleccione ]");
    });
    
    /*
    $("#btnAsignarRep").click(function(){
    	//alert("hola");
    	var validator = $('#formAsignar').data('bootstrapValidator');
	    validator.validate();
	    if (validator.isValid()) {
	    	$.ajax({
		          type: "POST",
		          url: "asignaTrabajador", 
		          data: $('#formAsignar').serialize(),
		          success: function(data){
		        	listarTablas(lista);
		        	mostrarMensaje(data.mensaje);
		        	//limpiarFormCliente();
		          },
		          error: function(){
			          //listarTablas();
		        	  mostrarMensaje(MSG_ERROR);
		          }
		     });
		}
		    
	  });
    */
    $('#idRegistrar').bootstrapValidator({      
      	 fields:{
      		 
      		 Servicio: {
   	    	selector:'#idServicio',   
                  validators: {    
                      notEmpty: {    
                          message: 'Elija un Servicio'    
                      },      
                      integer: {       
                          message: 'Elija un Servicio'    
                      },    
                  }    
              },
              Fecha: {
        	    	selector:'#idFecAtencion',   
                       validators: {    
                     	  notEmpty: {    
	                            
                     		  message: 'Ingrese Hora de Atencion'    
  	                          	},      
  	                            	date: {        
  	                                message: 'Ingrese una fecha valida'
  	                            },   
                       }    
               },
              HoraAte: {
      	    	selector:'#idHoraAtencion',   
                     validators: {    
                         notEmpty: {    
                             message: 'Ingrese Hora de Atencion'    
                        	},      
                          	time: {        
                              message: 'Ingrese una hora valida'    
                          },     
                     }    
                 },
                Observaciones: {
         	    	selector:'#idObservaciones',   
                        validators: {    
                            notEmpty: {    
                                message: 'Ingrese alguna observacion'    
                            },        	                             
                        }    
                    },
                    Vetrinario: {
              	    	selector:'#idVeterinario',   
                             validators: {    
                                 notEmpty: {    
                                     message: ''    
                                	},      
                                  	integer: {        
                                      message: 'Elija un veterinario'    
                                  },     
                             }    
                         }
              
           }
         
      	 });
		    
});
    
    
   
 </script> 


</body>

</html>