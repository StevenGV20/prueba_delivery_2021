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
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Atencion Pedidos</h1>
                    <p class="mb-4">En esta seccion podra atender los pedidos de los clientes.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Pedidos</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tbPedido" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Nombre del cliente</th>
                                            <th>Pedido solicitado</th>
                                            <th>Fecha de Pedido</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Nombre del cliente</th>
                                            <th>Pedido solicitado</th>
                                            <th>Fecha de Pedido</th>
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
                      <h2>Registrar consultas</h2>
                    </div>
                    <form  method="post" action="" id="idRegistrar" data-toggle="validator" class="mt-3 form-horizontal">
                      <div class="row">
                        <div class="col-md-6">
                          <fieldset class="form-group">
                         	<input type="text" hidden="" class="input" value="0" name="idpedido" id="idCodigo" placeholder="Ingresar nombre">
							<input type="text" class="input"  name="nombre" id="idnombre" placeholder="Ingresar nombre">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset class="form-group">
                         	
							<input type="text" class="input"  name="regPedido" id="idregPedido" placeholder="Ingresar Pedido">
                          </fieldset>
                        </div>
                        <div class="col-md-12">
                          <fieldset class="form-group">
                         	
							<input type="text" class="input"  name="fechaPedido" id="idfechaPedido" placeholder="Ingresar fecha">
                          </fieldset>
                        </div>
                       
                        <div class="col-md-12 mt-2">
                          <button type="button" class="btn__submit" id="btnRegistrar">Registrar</button>  		
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
                        <span aria-hidden="true">√ó</span>
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
    
    <script src="popup.js"></script>
    
    <script type="text/javascript">  


$(document).on("click","#btnEditar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Editar Area");
	$.getJSON("buscaPedido2XID",{id:cod},function(data){
		$("#idCodigo").val(data.idincidencia);
		$("#idnombre").val(data.nombre);
		$("#idregPedido").val(data.regIncidencia);
		$("#idfechaPedido").val(data.fechaHistorial);
	})
	bloquear(false);
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
    listarTablas();
    
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
		          url: "registroPedido", 
		          data: $('#nuevo').serialize(),
		          success: function(data){
		        	listarTablas();
		        	mostrarMensaje(data.mensaje);
		        	limpiarFormConsulta();
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
            url: "eliminaPedido2", 
            data: $('#id_form_elimina').serialize(),
            success: function(data){           	 
	           	 listarTablas();
	           	 mostrarMensaje(data.mensaje);
            },
            error: function(){
          	  mostrarMensaje(MSG_ERROR);
            }
       });
    });
    
    $(document).ready(function(){    
        $('#idRegistrar').bootstrapValidator({      
       	 fields:{
       		nombre: {
    	    	selector:'#idnombre',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese Nombre'    
                       },      
                       regexp: {    
                           regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄\s\w]+$/,    
                           message: 'Letras y n˙meros'    
                       },    
                   }    
               },
            regPedido: {
 	    	selector:'#idregPedido',   
                validators: {    
                    notEmpty: {    
                        message: 'Ingrese Consulta'    
                    },      
                    regexp: {    
                        regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄\s\w]+$/,    
                        message: 'Letras y n˙meros'    
                    },    
                }    
            },
          fechaPedido: {
	    	selector:'#idfechaPedido',   
               validators: {    
            	   date: {
                       format: 'DD/MM/YYYY',
                           message: 'El formato es dd/mm/yyyy'
                   },
                   notEmpty: {
                   message: 'El campo no puede estar vacio' 
                   },  
               }    
           }
       	 }
       }); 
    }); 
    
} );
 </script> 


</body>

</html>