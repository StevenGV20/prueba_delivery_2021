<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>${requestScope.objServicio.nombre}</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        
      <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">


    	<link rel="stylesheet" href="css/bootstrapValidator.css"/>
    
       	<link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">
        
        <!-- Template Stylesheet -->
        <link href="css/style_theme_blue.css" rel="stylesheet">
        
        <style type="text/css">
        	.img_card{
        		width:100%;
        		height:400px;
        	}
        </style>
    </head>

    <body>
       <!-- Top bar Start -->
		<jsp:include page="menuCliente.jsp"></jsp:include>
        <!-- Nav Bar End -->      
           
        <div class="container">
        <!-- Bottom Bar End --> 
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Inicio</a></li>
                    <li class="breadcrumb-item"><a href="verListaServicios">Servicios</a></li>
                    <li class="breadcrumb-item active">Detalle de Servicio</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Product Detail Start -->
        <div class="product-detail">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product-detail-top">
                            <div class="row align-items-center">
                                <div class="col-md-5">
                                    <div class="product-slider-single normal-slider">
                                        <img src="img/${requestScope.objServicio.foto}" alt="No existe">
                                    </div>
                                   <!-- <div class="product-slider-single-nav normal-slider">
                                        <div class="slider-nav-img"><img src="img/${requestScope.objServicio.foto}" alt="No existe"></div>
                                    </div> --> 
                                </div>
                                <div class="col-md-7">
                                    <div class="product-content">
                                        <div class="title"><h2>${requestScope.objServicio.nombre}</h2></div>
                                        <div class="ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="price">
                                            <h4>Precio:</h4>
                                            <p>S/. ${requestScope.objServicio.precio} <!--<span>$149</span>--></p>
                                        </div>
                                        <div class="quantity">
                                            <h4>Horario:</h4>
                                            <p>${requestScope.objServicio.horario} <!--<span>$149</span>--></p>
                                        </div>
                                        <div class="quantity">
                                           <input type="text" hidden="" value="${requestScope.objServicio.idservicio}" id="idCodigo" name="idproducto">
                                           
                                        </div>
                                        
                                        <c:if test="${sessionScope.objUsuario!=null}">
	                                        <div class="action">
	                                            <button class="btn btn-primary" id='btnSolicitar' data-toggle='modal'  data-target='#nuevo'><i class="fa fa-shopping-bag"></i> Solicitar</button>
	                                        </div>
                                        </c:if>
                                        <c:if test="${sessionScope.objUsuario==null}">
	                                        	<p>Para solicitar el servicio debe:</p>
	                                        <div class="action text-light">
	                                            <a class="btn btn-info" href="verRegistroCliente" id=''>Registrarse</a>
	                                            <a class="btn btn-danger" href="verLogin" id=''>Iniciar Sesion</a>
	                                        </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row product-detail-bottom">
                            <div class="col-lg-12">
                                <ul class="nav nav-pills nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link active text-light" data-toggle="pill" href="#description">Description</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div id="description" class="container tab-pane active color-white">
                                       <div>${requestScope.objServicio.descripcion}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <div class="product">
                            <div class="section-header">
                                <h1>Otros Servicios</h1>
                            </div>

                            <div class="row align-items-center product-slider product-slider-3">
	                             <c:forEach items="${sessionScope.LISTASERVICIOS}" var="item">
	                                <div class="col-lg-4">
	                                    <div class="product-item">
	                                        <div class="product-title">
	                                            <a href="verDetalleServicio?id=${item.idservicio}">${item.nombre}</a>
	                                            <div class="ratting">
	                                                <i class="fa fa-star"></i>
	                                                <i class="fa fa-star"></i>
	                                                <i class="fa fa-star"></i>
	                                                <i class="fa fa-star"></i>
	                                                <i class="fa fa-star"></i>
	                                            </div>
	                                        </div>
	                                        <div class="product-image">
	                                            <a href="verDetalleServicio?id=${item.idservicio}">
	                                                <img src="img/${item.foto}" class="img_card" alt="Product Image">
	                                            </a>
	                                            <div class="product-action">
	                                                <a href="verDetalleServicio?id=${item.idservicio}"><i class="fa fa-search"></i></a>
	                                            </div>
	                                        </div>
	                                        <div class="product-price">
	                                            <h3><span>S/. </span>${item.precio}</h3>
	                                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Comprar</a>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>  
                            </div>
                        </div>
                    </div>
                    
                    <!-- Side Bar Start -->
                   
                    <!-- Side Bar End -->
                </div>
            </div>
        </div>
        </div>
        
        <!-- Product Detail End -->
        
        <!-- Brand Start -->
        <div class="brand">
            <div class="container-fluid">
                <div class="brand-slider">
                    <div class="brand-item"><img src="img/brand-1.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-2.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-3.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-4.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-5.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-6.png" alt=""></div>
                </div>
            </div>
        </div>
        <!-- Brand End -->
        
        
<div class="modal fade bd-example-modal-lg" id="nuevo"  data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
 		 <section class="forms ml-4 mr-4 m-4">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12">
                    <div class="section-heading">
                      <h2>Solicitar el servicio</h2>
                    </div>
                    <form  method="post" action="" id="idRegistrar" data-toggle="validator" class="mt-3 form-horizontal">
                      <div class="row">
                        <div class="col-md-6">
                         	<label for="staticEmail">Fecha de Atención:</label>
							<input class="form-control" id="idServicio" name="servicio.idservicio" hidden=""/>
							<input class="form-control" type="date" id="idFecAtencion" name="fechaAtencion" placeholder="Ingrese Fecha de Atención"/>
                         </div> 
                         <div class="col-md-6">
                         	<label for="staticEmail">Hora de Atención:</label>
							<input class="form-control" type="time" id="idHoraAtencion" name="horaAtencion" placeholder="Ingrese Hora de Atención"/>
                         </div>
                         <div class="col-md-12">
                         	<label for="staticEmail">Observaciones</label>
							<textarea class="form-control" id="idObservaciones" name="observacion"></textarea>
                         </div> 
                       
                        <div class="col-md-12 mt-2">
                          <button type="button" class="btn btn-primary" id="btnRegistrar">Registrar</button>  		
        				  <button type="button" class="btn btn-danger" id="btnCancelar" data-dismiss="modal">Cancelar</button>
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
        
                        
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        
	    <script src="js/sweetalert2.min.js"></script>
	
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
        <script type="text/javascript" src="js/carrito_js.js"></script>
        <script type="text/javascript" src="js/verCarrito.js"></script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        
        <script type="text/javascript">
       
        $(document).on("click","#btnSolicitar",(function(){
        	var cod=$("#idCodigo").val();
        	$("#idServicio").val(cod);
        }));
		
        function limpiarForm(){
    		//bloquear(false);
    		$("#idRegistrar").trigger("reset");
    		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
    		//$("#idServici").val("0");
    	}

		function mensajeGood(mensaje){
			Swal.fire({
                type: 'success',
                title: 'Excelente',
                text: mensaje,
                showConfirmButton: false,
                timer: 2000
            })
		}
		
		function mensajeError(mensaje){
			Swal.fire({
                type: 'info',
                title: 'Opps...',
                text: mensaje,
                showConfirmButton: false,
                timer: 2000
            })
		}
        
        	$(document).ready(function(){
        		

        	    $("#btnRegistrar").click(function(){
        	    	var validator = $('#idRegistrar').data('bootstrapValidator');
        		    validator.validate();
        		    if (validator.isValid()) {
        		    	$.ajax({
        			          type: "POST",
        			          url: "mantenerCita", 
        			          data: $('#idRegistrar').serialize(),
        			          success: function(data){
        			        	 //mostrarMensaje(data.mensaje);
        			        	 if(!(data.estado)){
        			        		 mensajeError(data.mensaje);
        			        	 }else{
									 mensajeGood(data.mensaje);
            			        	 limpiarForm();
        			        	 }
        			          },
        			          error: function(){
        			        	  mostrarMensaje(MSG_ERROR);
        			          }
        			     });
        			}
        			    
        		  });
        	    
        	    $("#btnCancelar").click(function(){
        	    	limpiarForm();
        	    });
        		
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
        	                     }
        	               
        	            }
        	          
        	       	 });
        		
        	});
        	
        </script>
        
    </body>
</html>
