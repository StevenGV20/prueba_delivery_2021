<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mascotas - Administracion</title>
    
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
                <!--#include file="navbar.html"-->
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Lista de Mascotas</h1>
                    <p class="mb-4">En esta seccion podra registrar, ver y editar las mascotas de los clientes..</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Masacotas</h6>
                        </div>
                        <div class="cont_mant ml-2">
                            <label for="nomCliente">Cliente: </label>                       	
							<input type="search" class="input" id="nomCliente" placeholder="Cliente" disabled="disabled" value="${requestScope.cliente.nombre} ${requestScope.cliente.apellido}">
							<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#buscar">Buscar Cliente <i class="fa fa-plus-circle" aria-hidden="true"></i></button>  
                        </div>
					
                        
<div class="modal fade bd-example-modal-lg" id="buscar"  data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
 		 <section class="forms ml-4 mr-4 m-4">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12">
                    <div class="section-heading">
                      <h2>Buscar Cliente</h2>
                    </div>
                   		<div class="table-responsive">
                                <table class="table table-bordered table-hover" id="tbClientes" width="100%" cellspacing="0">
                                    <thead>
                                         <tr>
								            <th>ID</th>
								            <th>Nombre</th>
								            <th>Apellido</th>
								            <th>DNI</th>
								            <th>Telefono</th>
								            <th>Correo</th>
								        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
								            <th>ID</th>
								            <th>Nombre</th>
								            <th>Apellido</th>
								            <th>DNI</th>
								            <th>Telefono</th>
								            <th>Correo</th>
                                        </tr>
                                    </tfoot>
                                    <tbody  data-dismiss="modal">
                                        
                                    </tbody>
                                </table>
        				  <button type="button" class="btn__reset float-right" id="btnCancelar" data-dismiss="modal">Cancelar</button>
                      </div>
                  </div>
                </div>
              </div>
            </section>
      
    </div>
  </div>
</div>
                        
                        <div class="cont_mant ml-2">
							<button type="button" class="btn btn-info mt-4" id="btnNuevo" data-toggle="modal" data-target="#nuevo">Nuevo <i class="fa fa-plus-circle" aria-hidden="true"></i></button>  
						</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                         <tr>
								            <th>ID</th>
								            <th>Nombre</th>
								            <th>Raza</th>
								            <th>Sexo</th>
								            <th>Fecha de Nacimiento</th>
								            <th>Especie</th>
								            <th>Cliente</th>
								            <th></th>
								            <th></th>
								            <th></th>
								        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
								            <th>ID</th>
								            <th>Nombre</th>
								            <th>Raza</th>
								            <th>Sexo</th>
								            <th>Fecha de Nacimiento</th>
								            <th>Especie</th>
								            <th>Cliente</th>
								            <th></th>
								            <th></th>
								            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        
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
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
 		 <section class="forms ml-4 mr-4 m-4">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12">
                    <div class="section-heading">
                      <h2>Registrar Mascotas</h2>
                    </div>
                    <form  method="post" action="" id="idRegistrar" data-toggle="validator" class="mt-3 form-horizontal">
                      <div class="row">
                        <div class="col-md-6">
                          <fieldset class="form-group">
                         	<input type="text" class="input" value="0"  name="idmascota" id="idCodigo" hidden="">
                         	<input type="text" class="input"  name="cliente.idusuario" id="idCodCliente" hidden="">
                          	<input type="text" class="input"  name="nombre" id="idNombre" placeholder="Ingresar nombre">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>                           	
							<input type="text" class="input"  name="raza" id="idRaza" placeholder="Ingresar Raza">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>                           	
							<input type="text" class="input"  name="edad" id="idEdad" placeholder="Ingresar Edad">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>                           	
							<select id="idSexo"  class="input" name="sexo">	
								<option>[ Seleccione ]</option>
								<option>Macho</option>
								<option>Hembra</option>
							</select>
                          </fieldset>
                        </div>                        
                        <div class="col-md-6">
                          <fieldset>                           	
							<input type="date" class="input"  name="fechaNacimiento" id="idFechaNac" placeholder="Ingresar Fecha Nacimiento">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>
							<select id="idEspecie"  class="input" name="idespecie.idespecie">	
								<option>[ Seleccione ]</option>
							</select>
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
            </section>
      
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg" id="eliminar"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">¿Está seguro de eliminar?</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
        	¿Seguro de eliminar a la Mascota? 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="" method="post" name="formDelete" id="id_form_elimina">	
		  	  <input type="hidden" id="idEliminar" name="id">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	          <button type="button" id="btn_eliminar" data-dismiss="modal" class="btn btn-primary">Eliminar</button>
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


$("#tbClientes").on("click","tbody tr",(function(){
	var cod=$(this).children("td:eq(0)").html();
	var nom=$(this).children("td:eq(1)").html();
	var ape=$(this).children("td:eq(2)").html();
	$("#idCodCliente").val(cod);
	$("#nomCliente").val(nom+" "+ape);
	listarMascotas(cod);
	$("#btnNuevo").prop("disabled",false);
	//bloquear(true);
}));

$(document).on("click","#btnEliminar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#idEliminar").val(cod);
}));

$(document).on("click","#btnEditar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Editar Mascota");
	$.getJSON("buscarMascotaById",{cod:cod},function(data){
		$("#idCodigo").val(data.idmascota);
		$("#idCodCliente").val(data.cliente.idusuario);
		$("#idNombre").val(data.nombre);
		$("#idEdad").val(data.edad);
		$("#idFechaNac").val(data.fechaNacimiento);
		$("#idSexo").val(data.sexo);
		$("#idEspecie").val(data.idespcie.idespecie);
	})
	//bloquear(false);
}));


$(document).on("click","#btnEliminar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#idEliminar").val(cod);
}));


function bloquear(b){
	$("#idRegistrar input").prop("disabled",b);
	$("#idRegistrar select").prop("disabled",b);
	$("#btnRegistrar").prop("disabled",b);
}

function listarCliente(){
	$.getJSON("listaClientes",{},function(listar, q, t){
		console.log(listar);
		
		var editar="<button type='button' class='btn btn-success' id='btnEditar' data-toggle='modal'  data-target='#nuevo'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#eliminar' id='btnEliminar'>Eliminar</button>";

		$("#tbClientes tbody").empty();
		$.each(listar,function(index,item){
			$("#tbClientes tbody").append("<tr><td>"+item.idusuario+"</td><td>"+item.nombre+"</td><td>"+item.apellido+"</td><td>"+item.dni+
					"</td><td>"+item.telefono+"</td><td>"+item.correo+"</td></tr>");
		})
		  $("#tbClientes").DataTable();
    })
	
}

function listarMascotas(cod){
	$.getJSON("listaMascotasByCliente",{cod:cod},function(listar, q, t){
		console.log(listar);
		
		var editar="<button type='button' class='btn btn-success' id='btnEditar' data-toggle='modal'  data-target='#nuevo'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#eliminar' id='btnEliminar'>Eliminar</button>";

		$("#dataTable tbody").empty();
		$.each(listar,function(index,item){
			$("#dataTable tbody").append("<tr><td>"+item.idmascota+"</td><td>"+item.nombre+"</td><td>"+item.raza+"</td><td>"+item.sexo+
					"</td><td>"+item.fechaNacimiento+"</td><td>"+item.idespecie.nombre+"</td><td>"+
					item.cliente.nombre+" "+item.cliente.apellido+"</td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
		})
		  $("#dataTable").DataTable();
    })
	
}



function limpiarFormMascota(){
	var cod=$("#idCodCliente").val();
	$("#idRegistrar").trigger("reset");
	$("#idRegistrar").data("bootstrapValidator").resetForm(true);
	$("#idCodigo").val("0");
	$("#idCodCliente").val(cod);
	$("#idSexo").val("[ Seleccione ]");
	$("#idTipo").val("[ Seleccione ]");
}

$(document).ready( function () {

	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
	listarCliente();
	$("#btnNuevo").prop("disabled",true);
	 $.getJSON("listaEspecies",{},function(data, q,t){
	        console.log(data);
			$.each(data,function(index,item){
				$("#idEspecie").append("<option value='"+item.idespecie+"'>"+item.nombre+"</option>");
			})
	    })
    
    //alert("Hola");
    
    $("#btnCancelar").click(function(){
		//alert("hola");
		bloquear(false);
    	$("#idRegistrar").trigger("reset");
		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		$("#idRegistrar select").val("[ Seleccione ]");
    });
    
	 $("#btnRegistrar").click(function(){
	    	var validator = $('#idRegistrar').data('bootstrapValidator');
		    validator.validate();
		    if (validator.isValid()) {
			  	$.ajax({
			          type: "POST",
			          url: "registrarMascota", 
			          data: $('#idRegistrar').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  listarMascotas($("#idCodCliente").val());
			        	  limpiarFormMascota();
			        	  $("#btnNuevo").prop("disabled",true);
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			     });
		    }
		  });
    
	 $("#btn_eliminar").click(function(){

    	$("#eliminar").modal("hide");
   		$.ajax({
           type: "POST",
           url: "eliminaMascota", 
           data: $('#id_form_elimina').serialize(),
           success: function(data){
        	   listarMascotas($("#idCodCliente").val());
         	  listarMascotas();
         	  mostrarMensaje(data.mensaje);
           },
           error: function(){
         	  mostrarMensaje(MSG_ERROR);
           }
     	 });
     });
	  
	 
} );
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#idRegistrar').bootstrapValidator({      
       	 fields:{
       		 
       		 Nombre: {
    	    	selector:'#idNombre',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese nombre de Producto'    
                       },      
                       regexp: {    
                           regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                           message: 'Letras y números'    
                       },    
                   }    
               },
               Raza: {
       	    	selector:'#idRaza',   
                      validators: {    
                          notEmpty: {    
                              message: 'Ingrese nombre de Producto'    
                          },      
                          regexp: {    
                              regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                              message: 'Letras y números'    
                          },    
                      }    
                },
               	Edad: {
         	    	selector:'#idEdad',   
                        validators: {    
                            notEmpty: {    
                                message: 'Ingrese edad de su mascota'    
                            },      
                            regexp: {    
                                regexp: /^[0-9]{1,2}$/,    
                                message: 'Ingrese un numero entre 1 y 99'    
                            },    
                        }    
                  },
                Sexo: {
        	    	selector:'#idSexo',   
                       validators: {    
                           notEmpty: {    
                               message: 'Ingrese nombre de Producto'    
                           },      
                           regexp: {    
                               regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                               message: 'Letras y números'    
                           },    
                       }    
                },
                FechaNac: {
        	    	selector:'#idFechaNac',   
                       validators: {    
                           notEmpty: {    
                               message: 'Ingrese una fecha de Nacimiento'    
                           },      
                           date: {
                               message: 'La fecha tiene formato YYYY/MM/DD'
                           },    
                       }    
                   },
                   Especie: {
           	    	selector:'#idEspecie',   
                          validators: {    
                              notEmpty: {    
                            	  message: 'Por favor elija una especie'   
                              },      
       	                   integer: {      
    	                       message: 'Por favor elija una especie'    
    	                   },   
                          }    
                      },
	           idCliente: {
		    	selector:'#idCliente',   
	               validators: {    
	                   notEmpty: {    
	                       message: 'Por favor elija un cliente'    
	                   },      
	                   integer: {      
	                       message: 'Por favor elija un cliente'    
	                   },    
	               }    
	           }
       	 }
       }); 
    });
 </script>
</body>

</html>