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

        <!-- CSS Libraries
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
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
        
        
        
        <!-- Login Start -->
        <div class="login">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">    
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
									<input class="form-control" type="password" id="idPassword" name="password" placeholder="Ingrese ContraseÒa"/>
	                              </div>
                                <div class="col-md-12">
                                    <button class="btn" type="button" id="btnCliente">Registrar</button>
                                </div>
                                </div>
                            </form>
                    </div>
                    <div class="col-lg-6">
                        <form class="login-form" method="post"  id="formMascota" class="register-form" data-toggle="validator">
                            <div class="row">
                                <h4 align="center" class="col-md-12">Datos de Mascota</h4>
                                <div class="col-md-6">
	                            	<label for="staticEmail">Nombre</label>
									<input class="form-control" id="idCliente" name="idcliente.idusuario" placeholder="Ingrese Cliente" hidden=""/>
									<input class="form-control" id="idNombreMascota" name="nombre" placeholder="Ingrese Nombre de la mascota"/>
	                            </div> 
	                            <div class="col-md-6">
	                            	<label for="staticEmail">Raza</label>
									<input class="form-control" id="idRaza" name="raza" placeholder="Ingrese Raza"/>
	                            </div> 
	                            <div class="col-md-6">
	                            	<label for="staticEmail">Edad</label>
									<input class="form-control" id="idEdad" name="edad" placeholder="Ingrese Edad en meses"/>
	                            </div>
	                            <div class="col-md-6">
	                            	<label for="staticEmail">Fecha de Namiento</label>
									<input type="date" class="form-control" id="idFechaNac" name="fechaNacimiento" placeholder="Ingrese Fecha de Namiento"/>
	                            </div>      
	                             <div class="col-md-6">
                                    <label for="staticEmail">Sexo:</label>
									<select id="idSexo" name="sexo" class='form-control'>
			                                <option value="0" >[SELECCIONE]</option>
											<option>Hembra</option>
											<option>Macho</option>
			                         </select>
	                            </div>     
                                <div class="col-md-6">
                                    <label for="staticEmail">Tipo de Mascota</label>
									<select id="idEspecie" name="idespecie.idespecie" class='form-control'>
			                                 <option value=" " >[SELECCIONE]</option>
			                         </select>
	                            </div>
	                                     
	                   			<div class="modal-footer">
						        	<button type="button" id="btnMascota" class="btn btn-primary">Registrar</button>
						    	</div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login End -->
        
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
	
	<!-- Page level plugins 
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>-->
       <!-- Template Javascript -->
        <script src="js/main.js"></script>
<script type="text/javascript"> 

	function limpiarFormCliente(){
		//bloquear(false);
		$("#idRegistrarCliente").trigger("reset");
		$("#idRegistrarCliente").data("bootstrapValidator").resetForm(true);
		$("#idDistrito").val("[ Seleccione ]");
		//$("#idCodProducto").val("0");
	}

	function limpiarFormMascota(){
		$("#formMascota").trigger("reset");
		$("#formMascota").data("bootstrapValidator").resetForm(true);
		$("#idSexo").val("[ Seleccione ]");
		$("#idTipo").val("[ Seleccione ]");
	}

	function bloquearMascota(b){
		$("#formMascota input").prop("disabled",b);
		$("#formMascota select").prop("disabled",b);
		$("#btnMascota").prop("disabled",b);
	}

	function bloquearCliente(b){
		$("#idRegistrarCliente input").prop("disabled",b);
		$("#idRegistrarCliente select").prop("disabled",b);
		$("#btnCliente").prop("disabled",b);
	}
	
	        
	 $(document).ready( function () {
		$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
			$("#success-alert").slideUp(500);	
		});
		bloquearMascota(true);
		 $.getJSON("listaEspecies",{},function(data, q,t){
		        console.log(data);
				$.each(data,function(index,item){
					$("#idEspecie").append("<option value='"+item.idespecie+"'>"+item.nombre+"</option>");
				})
		    })
	   
	    $.getJSON("listaDistritos",{},function(data, q,t){
	        console.log(data);
			$.each(data,function(index,item){
				$("#idDistrito").append("<option value='"+item.iddistrito+"'>"+item.nombre+"</option>");
			})
	    })
	 /*
	    $("#btnRegistrar").click(function(){
	 
			//alert("øEst· seguro de enviar?");
			$("#idRegistrar").action("registrarCliente");
			$("#idRegistrar").submit();
	    });*/
	
	    $("#btnCliente").click(function(){
	    	var validator = $('#idRegistrarCliente').data('bootstrapValidator');
		    validator.validate();
		    if (validator.isValid()) {
		    	$.ajax({
			          type: "POST",
			          url: "registrarCliente", 
			          data: $('#idRegistrarCliente').serialize(),
			          success: function(data){
			        	  //listarTabla();
			        	  mostrarMensaje(data.mensaje);
			        	  //mostrarIdCliente(data.USUARIO.idusuario);
			        	 $("#idCliente").val(data.USUARIO.idusuario);
			        	 bloquearCliente(true);
			        	 bloquearMascota(false);
			        	 limpiarFormCliente();
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			     });
			}
			    
		  });
	
	    $("#btnMascota").click(function(){
	    	var validator = $('#formMascota').data('bootstrapValidator');
		    validator.validate();
		    if (validator.isValid()) {
			  	$.ajax({
			          type: "POST",
			          url: "registrarMascota", 
			          data: $('#formMascota').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje + "\n Ya puede iniciar sesion");
			        	  limpiarFormMascota();
			        	  bloquearMascota(true);
			        	  $(location).attr('href',"/verLogin");
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
                    	   regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄Ò—0-9\s\w]+$/,    
                           message: 'Letras y n˙meros'    
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
                              regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄Ò—0-9\s\w]+$/,    
                              message: 'Letras y n˙meros'    
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
                                        message: 'Ingrese telefono'    
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
                                              message: 'Ingrese telefono'    
                                          },
                                      }    
                                  }
               
            }
          
       	 });
  

        $('#formMascota').bootstrapValidator({      
       	 fields:{
       		 
       		 Cliente: {
    	    	selector:'#idCliente',   
                   validators: {    
                       notEmpty: {    
                           message: 'Debe registrarse primero'    
                       },   
                   }    
               },
               Mascota: {
       	    	selector:'#idNombreMascota',   
                      validators: {    
                          notEmpty: {    
                              message: 'Ingrese nombre de la Mascota'    
                          },      
                          regexp: {    
                              regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄Ò—0-9\s\w]+$/,    
                              message: 'Letras y n˙meros'    
                          },    
                      }    
                  },
                  Raza: {
           	    	selector:'#idRaza',   
                          validators: {    
                              notEmpty: {    
                                  message: 'Elija una raza'    
                              },      
                              regexp: {    
                                  regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄Ò—0-9\s\w]+$/,    
                                  message: 'Letras y n˙meros'    
                              },     
                          }    
                  },
                  Edad: {
             	    	selector:'#idEdad',   
                            validators: {    
                                notEmpty: {    
                                    message: 'Ingrese edad en Meses'    
                                },      
                                integer: {   
                                    message: 'Ingrese un numero entero'    
                                },     
                            }    
                    },
                 FechaNac: {
         	    	selector:'#idFechaNac',   
                        validators: {    
                            notEmpty: {    
                                message: 'Ingrese Fecha de Nacimiento'    
                            },      
                            date: {        
                                message: 'Ingrese una fecha valida'    
                            },    
                        }    
                    },
                    Sexo: {
           	    	selector:'#idSexo',   
                          validators: {    
                              notEmpty: {    
                                  message: 'El campo sexo es obligatorio'    
                              },      
                              regexp: {     
                            	  regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄Ò—\s\w]+$/,
                                  message: 'Elija un sexo'    
                              },    
                          }    
                      },
                      Especie: {
                 	    	selector:'#idEspecie',   
                                validators: {    
                                    notEmpty: {    
                                        message: 'El campo Especie es obligatorio'    
                                    },      
                                    integer: {   
                                        message: 'Elija una especie'    
                                    },    
                                }    
                            }
               
            }
          
       	 });
 }); 

 </script>  
    </body>
</html>
