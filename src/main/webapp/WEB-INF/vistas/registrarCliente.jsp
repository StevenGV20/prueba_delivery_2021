<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>E Store - eCommerce HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

   <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>
        <!-- Template Stylesheet -->
        <link href="css/style_theme_blue.css" rel="stylesheet">
        
          <style type="text/css">
        	form small{
        		color:red;
        	}
        </style>
    </head>

    <body>
        <!-- Top bar Start -->
        <jsp:include page="menuCliente.jsp"></jsp:include>
        <!-- Nav Bar End -->      
        
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
        
        <!-- Login Start -->
        <div class="login">
            <div class="container-fluid">
            <c:if test="${requestScope.MENSAJE!=null}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert" id="success-alert">
			  <strong></strong> ${requestScope.MENSAJE}
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			</c:if>
			<c:remove var="CORRECTO"/>
                <div class="row">
                    <div class="col-md-6 mx-auto" style="width: 200px;">
                        <form action="registrarCliente" method="post" id="idRegistrarCliente" class="register-form" data-toggle="validator">
                            <div class="row">
                            	<h4 align="center" class="col-md-12">Datos del Cliente</h4>
                                <div class="col-md-6">
	                                <label for="staticEmail">Nombre</label>
									<input class="form-control" id="idNombre" name="nombre" placeholder="Ingrese Nombre"/>
	                             </div>    
	                             <div class="col-md-6">
	                                <label for="staticEmail">Apellido</label>
								   	<input class="form-control" id="idApellido" name="apellido" placeholder="Ingrese Apellido">
	                              </div>
	                              <div class="col-md-6">
                       				<label>Elija un Distrito</label>
									<select id="idDistrito"  class="form-control" name="iddistrito">	
										<option>[ Seleccione ]</option>
									</select>
                        			</div>
                        			 <div class="col-md-6">
                       				<label>Sexo:</label>
									<select id="idSexo"  class="form-control" name="sexo">	
										<option>[ Seleccione ]</option>
										<option value="1">MASCULINO</option>
										<option value="2">FEMENINO</option>
									</select>
                        			</div>
	                              <div class="col-md-6">
	                                <label for="staticEmail">Direccion</label>
									<input class="form-control" id="idDireccion" name="direccion" placeholder="Ingrese Direccion"/>
	                              </div> 
	                              <div class="col-md-6">
									<label for="staticEmail">Telefono</label>
									<input class="form-control" id="idTelefono" name="telefono" placeholder="Ingrese Telefono"/>
	                              </div>
	                              <div class="col-md-6">
									<label for="staticEmail">Dni</label>
									<input class="form-control" id="idDni" name="dni" placeholder="Ingrese Dni"/>
	                              </div>
	                              <div class="col-md-6">
									<label for="staticEmail">Correo</label>
									<input class="form-control" id="idCorreo" name="correo" placeholder="Ingrese Correo"/>
	                              </div>
	                              <div class="col-md-6">
									<label for="staticEmail">Password</label>
									<input class="form-control" type="password" id="idPassword" name="password" placeholder="Ingrese Contraseña"/>
	                              </div>
                                <div class="col-md-12">
                                    <button class="btn border" type="button" id="btnCliente">Registrar</button>
                                </div>
                                </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
       <!-- Login End -->
        
       <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Maqueta V.01 &copy; Pagina hecha 2021</span>
                    </div>
                </div>
            </footer>
        <!-- End of Footer -->
        
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
	
	<script src="js/global.js"></script>
    <script src="popup.js"></script>
    
	<script type="text/javascript" src="js/bootstrap.min.js"></script> 
<!-- 	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script> -->
	<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
        
        <script type="text/javascript" src="js/carrito_js.js"></script>
        <script type="text/javascript" src="js/verCarrito.js"></script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        
<script type="text/javascript"> 
        
 $(document).ready( function () {
	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
    
   
    $.getJSON("listaDistritos",{},function(data, q,t){
        console.log(data);
		$.each(data,function(index,item){
			$("#idDistrito").append("<option value='"+item.iddistrito+"'>"+item.nombre+"</option>");
		})
    })
 
    $("#btnRegistrar").click(function(){
 
		//alert("¿Está seguro de enviar?");
		$("#idRegistrar").action("registrarCliente");
		$("#idRegistrar").submit();
    });
    
    $("#btnCliente").click(function(){
    	var validator = $('#idRegistrarCliente').data('bootstrapValidator');
	    validator.validate();
	    if (validator.isValid()) {
	    	$.ajax({
		          type: "POST",
		          url: "registrarCliente", 
		          data: $('#idRegistrarCliente').serialize(),
		          success: function(data){
		        	 mostrarMensaje(data.mensaje);
		        	 if(data.state==0){}
		        	 else{
		        		 $(location).attr('href',"/verLogin");
			        	 limpiarFormCliente();
		        	 }
		        	 
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		     });
		}		    
	  });

    $('#idRegistrarCliente').bootstrapValidator({      
      	 fields:{
      		 
      		 Nombre: {
   	    	selector:'#idNombre',   
                  validators: {    
                      notEmpty: {    
                          message: 'Ingrese nombre'    
                      },      
                      regexp: {    
                   	   regexp: /^[a-zA-ZáéíóúÁÉÍÓÚñÑ0-9\s\w]+$/,    
                          message: 'Letras y números'    
                      },    
                  }    
              },
              Apellido: {
      	    	selector:'#idApellido',   
                     validators: {    
                         notEmpty: {    
                             message: 'Ingrese apellido'    
                         },      
                         regexp: {    
                             regexp: /^[a-zA-ZáéíóúÁÉÍÓÚñÑ0-9\s\w]+$/,    
                             message: 'Letras y números'    
                         },    
                     }    
                 },
                 Distrito: {
          	    	selector:'#idDistrito',   
                         validators: {    
                             notEmpty: {    
                                 message: 'Elija un distrito'    
                             },
                             integer: {       
                                 message: 'Por favor elija un distrito'    
                             },    
                         }    
                 },
                Direccion: {
         	    	selector:'#idDireccion',   
                        validators: {    
                            notEmpty: {    
                                message: 'Ingrese direccion'    
                            },  
                        }    
                    },
                Telefono: {
        	    	selector:'#idTelefono',   
                       validators: {    
                           notEmpty: {    
                               message: 'Ingrese telefono'    
                           },      
                           regexp: {    
                               regexp: /^[0-9]{7,9}/, 
                               	 message: ' '   
                           },
                           stringLength:{
                         	  message: 'Ingrese un numero Fijo o de Celular',
                         	  min: 7,
                         	  max: 9
                           },    
                       }    
                   },
                   DNI: {
          	    	selector:'#idDni',   
                         validators: {    
                             notEmpty: {    
                                 message: 'Ingrese Dni'    
                             },      
                             regexp: {    
                                 regexp: /^[0-9]{8}/,
                                 message: ' '
                             },
                             stringLength:{
                           	  message: 'El DNI es de 8 digitos',
                           	  min: 8,
                           	  max: 8
                             },
                         }    
                     },
                     Correo: {
           	    		selector:'#idCorreo',   
                          validators: {    
                              notEmpty: {    
                                  message: 'Ingrese un correo'    
                              },      
                              emailAddress: {   
                                  message: 'Ingrese un correo valido'    
                              },    
                          }    
                      },
                      Password: {
                 	    	selector:'#idPassword',   
                                validators: {    
                                    notEmpty: {    
                                        message: 'Ingrese su clave'    
                                    },
                                }    
                            },
                            Sexo: {
                     	    	selector:'#idSexo',   
                                    validators: {    
                                        notEmpty: {    
                                            message: ''    
                                        },      
                                        integer: {    
                                            message: 'Elija un Sexo'    
                                        },     
                                    }    
                            }
              
           }
         
      	 });  
    
  });
 </script>    
</body>
    
    
</html>
