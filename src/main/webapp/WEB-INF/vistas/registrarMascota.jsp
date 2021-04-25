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

        <!-- Template Stylesheet -->
        <link href="css/style_theme_blue.css" rel="stylesheet">
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
                <div class="row">
                    <div class="col-lg-6">    
                        <div class="register-form">
                        <form action="registrarMascota" method='post'>
                            <div class="row">
                            	<h4 align="center" class="col-md-12">Datos de la Mascota</h4>
                                <div class="col-md-6">
	                                <label for="staticEmail">Nombre</label>
									<input class="form-control" id="idNombre" name="nombre" placeholder="Ingrese Nombre"/>
	                             </div>    
	                             <div class="col-md-6">
	                                <label for="staticEmail">Raza</label>
								   	<input class="form-control" id="idRaza" name="raza" placeholder="Ingrese Raza">
	                              </div>
	                              <div class="col-md-6">
	                                <label for="staticEmail">Edad</label>
								   	<input class="form-control" id="idEdad" name="edad" placeholder="Ingrese Edad">
	                              </div>
	                              
	                              <div class="col-md-6">
                         			 <fieldset class="block">
                         				 <label>Sexo</label>
											<select id="idSexo"  class="input" name="sexo">	
											<option>[ Seleccione ]</option>
											<option>Hembra</option>
											<option>Macho</option>
											</select>
						 			</fieldset>
                        			</div>
                        			<div class="col-md-6">
                          			<fieldset>
                          			<label>Fecha de Nacimiento</label>                           	
									<input type="text" class="input"  name="fechaNacimiento" id="idFechaNac" placeholder="Ingresar Fecha Nacimiento">
                          			</fieldset>
                       				</div>
	                             	<div class="col-md-6">
                         			 <fieldset class="block">
                         				 <label>Elija una Especie</label>
											<select id="idEspecie"  class="input" name="idespecie">	
											<option>[ Seleccione ]</option>
											</select>
						 			</fieldset>
                        			</div>
                                <div class="col-md-12">
                          		<button type="submit" class="btn__submit" id="btnRegistrar">Registrar</button>  		
                                </div>
                            </div>
                            </form>
                        </div>
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
        
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        
<script type="text/javascript"> 
        
 $(document).ready( function () {
	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
    
   
    $.getJSON("listaEspecies",{},function(data, q,t){
        console.log(data);
		$.each(data,function(index,item){
			$("#idEspecie").append("<option value='"+item.idespecie+"'>"+item.nombre+"</option>");
		})
    })
 
    $("#btnRegistrar").click(function(){
 
		//alert("¿Está seguro de enviar?");
		$("#idRegistrar").action("registrarMascota");
		$("#idRegistrar").submit();
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
                           message: 'Ingrese nombre'    
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
                             regexp: {    
                                 regexp: /^[a-zA-ZáéíóúÁÉÍÓÚñÑ0-9\s\w]+$/,    
                                 message: 'Letras y números'    
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
                                      regexp: /^[0-9]{15}/,    
                                      message: 'Ingrese solo numeros'    
                                  },    
                              }    
                          },
               
            },
          
            }
       	 }
       }); 
    });
 </script>    
</body>
    
    
</html>
