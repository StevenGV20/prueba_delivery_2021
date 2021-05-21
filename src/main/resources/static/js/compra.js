const compra = new Carrito();
const listaCompra = document.querySelector("#lista-compra tbody");
const carrito = document.getElementById('carrito');
const procesarCompraBtn = document.getElementById('procesar-compra');

const cliente = document.getElementById('idCliente');
const correo = document.getElementById('idCorreo');
const boton = document.getElementsByTagName('#carrito button');

const listaProductos = document.querySelector('#lista-carrito tbody');
const vaciarCarritoBtn = document.getElementById('vaciar-carrito');
const procesarPedidoBtn = document.getElementById('procesar-pedido');


cargarEventos();

function cargarEventos() {
    document.addEventListener('DOMContentLoaded', compra.leerLocalStorageCompra());

    //Eliminar productos del carrito
    carrito.addEventListener('click', (e) => { compra.eliminarProducto(e) });

    compra.calcularTotal();

    //cuando se selecciona procesar Compra
    procesarCompraBtn.addEventListener('click', procesarCompra);
    
   //boton.addEventListener('click', (e) => { compra.obtenerEvento(e)});
    
    carrito.addEventListener('click', (e) => { compra.obtenerEvento(e) });
    
    carrito.addEventListener('keyup', (e) => {compra.obtenerEvento(e) });


    
    //productos.addEventListener('click', (e)=>{compra.comprarProducto(e)});

    //Cuando se elimina productos del carrito
    //carrito.addEventListener('click', (e)=>{compra.eliminarProducto(e)});

}

function procesarCompra() {
    // e.preventDefault();
    if (compra.obtenerProductosLocalStorage().length === 0) {
        Swal.fire({
            type: 'error',
            title: 'Oops...',
            text: 'No hay productos, selecciona alguno',
            showConfirmButton: false,
            timer: 4000
        }).then(function () {
            window.location = "/";
        })
    }
    else if (cliente.value === '' || correo.value === '') {
        Swal.fire({
            type: 'error',
            title: 'Oops...',
            text: 'Ingrese todos los campos requeridos',
            showConfirmButton: false,
            timer: 4000
        })
    }
    else {
       /* 
        //aqui se coloca el user id generado en el emailJS
        (function () {
            emailjs.init("user_CEozz2F39lJJOLF5mJiDA");
        })();

        //var myform = $("form #procesar-pago");

       // myform.submit( (event) => {
           // event.preventDefault();

            // Change to your service ID, or keep using the default service
            var service_id = "default_service";
            var template_id = "template_3SA9LsqQ";
*/
          /*  const cargandoGif = document.querySelector('#cargando');
            cargandoGif.style.display = 'block';

            const enviado = document.createElement('img');
            enviado.src = 'img/mail.gif';
            enviado.style.display = 'block';
            enviado.width = '150';*/

			var JsonLocalStorageObj = JSON.stringify(compra.obtenerProductosLocalStorage());
			
			$.ajax({
				url:"procesarCarrito",
				type:"POST",
				data:{carrito:JsonLocalStorageObj}, 
				success: function(result){
					//alert("funciona" + JsonLocalStorageObj);
					Swal.fire({
			            type: 'success',
			            title: 'Gracias por su compra',
			            text: 'Podrá ver su boleta en la sección Mis Ordenes',
			            showConfirmButton: true,
			            timer: 4000
			        })
                    setTimeout(() => {
                        compra.vaciarLocalStorage();
                        //enviado.remove();
                        window.location = "/";
                    }, 2000);
				},
				error: function(error){
					alert("No funciona");
				}
			});
			
/*
            emailjs.sendForm(service_id, template_id, myform[0])
                .then(() => {
                    cargandoGif.style.display = 'none';
                    document.querySelector('#loaders').appendChild(enviado);

                    setTimeout(() => {
                        compra.vaciarLocalStorage();
                        enviado.remove();
                        window.location = "index.html";
                    }, 2000);


                }, (err) => {
                    alert("Error al enviar el email\r\n Response:\n " + JSON.stringify(err));
                    // myform.find("button").text("Send");
                });*/

            //return false;

       // });

    }
}

