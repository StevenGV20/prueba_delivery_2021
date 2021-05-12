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
        
        <script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/bootstrapValidator.js"></script>
		<script type="text/javascript" src="js/global.js"></script>

		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
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
                        <form action="registroPedido" method="post" id="idRegistroPedido" class="register-form" data-toggle="validator">
                            <div class="row">
                            	<h4 align="center" class="col-md-12">INGRESE EL PEDIDO</h4>
                                <div class="col-md-6">
	                                <label for="staticEmail">Nombre</label>
									<input class="form-control" id="idnombre" name="nombre" placeholder="Ingrese Nombre"/>
	                             </div>    
	                             <div class="col-md-6">
	                                <label for="staticEmail">Registre el pedido</label>
								   	<input class="form-control" id="idregPedido" name="regPedido" placeholder="Ingrese su Consulta">
	                              </div>
	                              <div class="col-md-6">
	                                <label for="staticEmail">Fecha</label>
									<input class="form-control" id="idfechaPedido" name="fechaPedido" placeholder="Ingrese la fecha"/>
	                              </div> 
										<div class="form-group col-md-12" align="center">
											<button id="id_registrar" type="button" class="btn btn-primary" >Registra</button>
										</div>
                                </div>
                            </form>
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

$("#id_registrar").click(function (){ 

	var validator = $('#idRegistroPedido').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()){
		$.ajax({
			type: 'POST',  
			data: $("#idRegistroPedido").serialize(),
			url: 'registroPedido',
			success: function(data){
				mostrarMensaje(data.MENSAJE);
				limpiar();
				validator.resetForm();
			},
			error: function(){
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
});

function limpiar(){
	$("#idnombre").val('');
	$("#idregPedido").val('');
	$("#idfechaPedido").val('');
}

$('#idRegistroPedido').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#idnombre',
            validators: {
                notEmpty: {
                    message: 'La razon social es un campo obligatorio'
                },
                stringLength :{
                	message:'La razon social es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        regPedido: {
    		selector : '#idregPedido',
            validators: {
                notEmpty: {
                    message: 'El apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'El apellido es de 5 a 200 caracteres',
                	min : 5,
                	max : 200
                }
            }
        },
        fechaPedido: {
	    	selector : '#idfechaPedido',
            validators: {
                 date: {
                    format: 'DD/MM/YYYY',
                        message: 'El formato es dd/mm/yyyy'
                },
                notEmpty: {
                message: 'El campo no puede estar vacio'
              }
            }
          },  
    }   
});
</script>  
</body>
</html>
