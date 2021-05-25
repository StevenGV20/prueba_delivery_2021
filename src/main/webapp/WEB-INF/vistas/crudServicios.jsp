<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <c:if test="${sessionScope.objUsuario.idrol.idrol==null}">
    	<c:redirect url="/"/>
    </c:if>
    <c:if test="${sessionScope.objUsuario.idrol.idrol==1}">
    	<c:redirect url="/"/>
    </c:if>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Vendedor Admin - Servicios</title>
    
    
    <link rel="stylesheet" href="css/reset.css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
	<link rel="stylesheet" href="css/main.css">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <!-- EDITOR TEXT HTML 
    <link href="css/editor.css" type="text/css" rel="stylesheet"/>
    -->
	
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600|Open+Sans" rel="stylesheet"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
	<link rel="stylesheet" href="css/estilos.css">
    
    <script src="js/ckeditor.js"></script>
	<script src="js/sample.js"></script>
	<link rel="stylesheet" href="css/neo.css">
	
   <link href="css/dataTables.bootstrap.min.css" rel="stylesheet"> 
   <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>
    <!-- CSS only 
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>-->

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



<c:if test="${requestScope.CORRECTO!=null}">
<div class="alert alert-success alert-dismissible fade show" role="alert" id="success-alert">
  <strong></strong> ${requestScope.CORRECTO}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="CORRECTO"/>

<c:if test="${requestScope.ERROR!=null}">
<div class="alert alert-danger alert-dismissible fade show" role="alert" id="success-alert">
  <strong></strong> ${requestScope.ERROR}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="ERROR"/>

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Lista de Servicios</h1>
                    <p class="mb-4">En esta seccion podra registrar, ver y editar los servicios.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Servicios</h6>
                        </div>
                        <div class="cont_mant ml-2">
							<button type="button" class="btn btn-info mt-4" data-toggle="modal" data-target="#nuevo">Nuevo <i class="fa fa-plus-circle" aria-hidden="true"></i></button>  
						</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tbServicios" width="100%" cellspacing="0">
                                    <thead>
                                         <tr>
								            <th>ID</th>
								            <th>Nombre</th>
								            <th>Descripcion</th>
								            <th>Horario</th>
								            <th>Precio(S/.)</th>
								            <th>Categoria</th>
								            <th></th>
								            <th></th>
								            <th></th>
								        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                           <th>ID</th>
								            <th>Nombre</th>
								            <th>Descripcion</th>
								            <th>Horario</th>
								            <th>Precio(S/.)</th>
								            <th>Categoria</th>
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
                      <h2>Registrar Servicio</h2>
                    </div>
                    <form  method="post" action="mantenerServicio" id="idRegistrar" data-toggle="validator" enctype="multipart/form-data" class="mt-3 form-horizontal">
                      <div class="row">
                        <div class="col-md-6">
                          <fieldset class="form-group">
                         	<input type="text" value="0" class="input"  name="idservicio" id="idCodServicio" hidden="true">
							<input type="text" class="input"  name="nombre" id="idNombre" placeholder="Ingresar nombre">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>
							<input type="text" class="input"  name="precio" id="idPrecio" placeholder="Ingresar Precio">
                          </fieldset>
                        </div>
                        <div class="col-md-12">
                          <fieldset>
							<textarea class="input"  name="descripcion" id="idDescripcion" placeholder="Ingresar Descripcion"></textarea>
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>
							<input type="text" class="input"  name="horario" id="idHorario" placeholder="Ingresar Horario del Servicio">
                          </fieldset>
                        </div>
                        <!-- 
                        <div class="col-md-6">
                          <fieldset>
							<input type="text" class="input"  name="fecha" id="idFecha" placeholder="Ingresar Fecha del Servicio">
                          </fieldset>
                        </div>
                         -->
                        <div class="col-md-6">
                          <fieldset>
                         	<label>Elige una categoria::</label>    
							<select id="idCategoria"  class="input" name="idcategoria.idcategoria">	
								<option>[ Seleccione ]</option>
							</select>
						 </fieldset>
                        </div>
                        
                       <div class="col-md-6">
                          <fieldset>
                         	<label>Subir Imagen:</label>                           	
							<input type="file" class="input"  name="file" id="idFoto" placeholder="Ingresar Foto">
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
        	¿Seguro de eliminar el Producto? 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="eliminaServicio" method="post" name="formDelete" id="id_form_elimina">	
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
	<script src="js/global.js"></script>
    <script src="popup.js"></script>
    
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script> -->
	<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
	
	<!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
   
    <script type="text/javascript">

$(document).on("click","#btnDetalles",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Detalles del Producto");
	$.getJSON("",{codigo:cod},function(data){
		
	})
	bloquear(true);
}));

$(document).on("click","#btnEditar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Editar Servicio");
	$.getJSON("buscaServicioXID",{id:cod},function(data){
		$("#idCodServicio").val(data.idservicio);
		$("#idNombre").val(data.nombre);
		$("#idPrecio").val(data.precio);
		$("#idDescripcion").val(data.descripcion);
		$("#idHorario").val(data.horario);
		$("#idCategoria").val(data.idcategoria.idcategoria);
		//$("#idFecha").val(data.fecha);
	})
	bloquear(false);
}));


$(document).on("click","#btnEliminar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#idEliminar").val(cod);
}));

$(document).on("click","#btnEditar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#idEliminar").val(cod);
}));


function bloquear(b){
	$("#idRegistrar input").prop("disabled",b);
	$("#idRegistrar select").prop("disabled",b);
	$("#btnRegistrar").prop("disabled",b);
}

function listarTabla(){
	$('#tbServicios tbody').append('<tr><td class="loading text-center mb-5" colspan="10"><img src="img/cargando.gif" width="10%" alt="loading" /><br/>Un momento, por favor...</td> </tr>');
	$.getJSON("listaServicios",{},function(lista, q, t){
		console.log(lista);
		$("#tbServicios tbody").empty();
		//var detalles="<button type='button' class='btn btn-info' id='btnDetalles' data-toggle='modal'  data-target='#idModalFoto'>Subir Foto</button>";
		var editar="<button type='button' class='btn btn-success' id='btnEditar' data-toggle='modal'  data-target='#nuevo'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#eliminar' id='btnEliminar'>Eliminar</button>";
		$.each(lista,function(index,item){
			$("#tbServicios tbody").append("<tr><td>"+item.idservicio+"</td><td>"+item.nombre+"</td><td style='width:40%;'>"+item.descripcion+"</td><td>"+item.horario+"</td><td>"+
					parseFloat(item.precio).toFixed(2)+"</td><td>"+item.idcategoria.nombre+"</td><td><img src='img/"+item.foto+"'  alt='No existe' style='width: 200px;'/></td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
		})
		//$("#tbServicios img").css("width","100%");
	    $("#tbServicios").DataTable();
    })
	
}


$(document).ready( function () {

    
	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
	listarTabla();
    //alert("Hola");
    
     $.getJSON("listaCategorias",{},function(data, q,t){
        console.log(data);
		//$("#idCategoria").append("<option></option>");
		$.each(data,function(index,item){
			//$("#idCategoria").emmpty();
			$("#idCategoria").append("<option value='"+item.idcategoria+"'>"+item.nombre+"</option>");
		})
    })
    
    
    $("#btnCancelar").click(function(){
		//alert("hola");
		bloquear(false);
    	$("#idRegistrar").trigger("reset");
		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
		$("#idCodServicio").val("0");
    });
     
     $("#btn_eliminar").click(function(){
    	 $("#eliminar").modal("hide");
     	$.ajax({
             type: "POST",
             url: "eliminaServicio", 
             data: $('#id_form_elimina').serialize(),
             success: function(data){
            	 
	           	 listarTabla();
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
                           regexp: /^[a-zA-ZáéíóúÁÉÍÓÚñÑ0-9\s\w]+$/,    
                           message: 'Letras y números'    
                       },    
                   }    
               },
               Precio: {
          	    	selector:'#idPrecio',   
                         validators: {    
                             notEmpty: {    
                                 message: 'Ingrese Precio del Servicio'    
                             },      
                             numeric: {        
                                 message: 'Ingrese un numero con formato: ###.##'    
                             },    
                         }    
                 },
	           Descripcion: {
		    	selector:'#idDescripcion',   
	               validators: {    
	                   notEmpty: {    
	                       message: 'Ingrese Descripcion del Servicios'    
	                   },  
	               }    
	           },
	           Horario: {
	      	    	selector:'#idHorario',   
	                     validators: {    
	                         notEmpty: {    
	                             message: 'Ingrese Horario del Servicio'    
	                         }, 
	                     }    
	             },
           Fecha: {
      	    	selector:'#idFecha',   
                     validators: {    
                         notEmpty: {    
                             message: 'Ingrese Horario del Servicio'    
                         }, 
                     }    
             },
         	Categoria: {
     	    	selector:'#idCategoria',   
                    validators: {    
                        notEmpty: {    
                            message: 'Elija una categoria'    
                        },
                        integer:{
                            message:"Elija una categoria"
                        },    
                    }    
            },
         	Foto: {
     	    	selector:'#idFoto',   
                    validators: {    
                        notEmpty: {    
                            message: 'Ingresa una foto'    
                        },  
                    }    
            }
       	 }
       }); 
    });
 </script>
</body>

</html>