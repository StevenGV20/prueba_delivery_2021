class Carrito {

    //Añadir producto al carrito
    comprarProducto(e){
        e.preventDefault();
        if(e.target.classList.contains('agregar-carrito')){
        
	        let cod=$("#idCodigo").val();
	        let nom=$("#idNombre").text();
	        let pre=$("#idPrecio").text();
	        let can = $("#idCantidad").val();
	        let foto1=$("#idFoto1").attr("src");
	        let foto2=$("#idFoto2").attr("src");
	        let foto3=$("#idFoto3").attr("src");
	    	let stock=$("#idStock").text();
        	
             //const producto = e.target.parentElement.parentElement;
            /*const producto = "<div>"+cod+"</div><div>"+nom+"</div><div>"+pre
            +"</div><div>"+can+"</div><div>"+foto1+"</div><div>"+foto2+"</div><div>"+
            foto3+"</div>";*///
            //const producto = document.getElementById('detalleProducto').innerHTML;
            
            if(this.verificarStock(can,stock))
            {
	            let producto = [cod,nom,pre,can,foto1,foto2,foto3,stock];
	            console.log(producto);
	            this.leerDatosProducto(producto);
            }
            else{
            	
            }
        }
    }//

	verificarStock(can,stock){
		if(parseInt(can)>parseInt(stock)){
			Swal.fire({
                type: 'info',
                title: 'Oops...',
                //text: 'El producto se actulizo correctamente',
                text: 'La cantidad solicitada sobrepasa al stock',
                showConfirmButton: false,
                timer: 1500
            })
	            return false;
		}
		else 
			return true;
	}


    //Leer datos del producto
    leerDatosProducto(producto){
        const infoProducto = {
            imagen : producto[4],
            nombre: producto[1],
            precio: producto[2],
            idproducto: producto[0],
            cantidad: producto[3],
            precioTotal: producto[3]*producto[2],
            importe: 0,
            igv: 0,
            descuento: 0,
            montoTotal: 0,
            stock: parseInt(producto[7])
        }
        let productosLS;
        productosLS = this.obtenerProductosLocalStorage();
        console.log("leer"+productosLS);
        productosLS.forEach(function (productoLS){
            if(productoLS.idproducto === infoProducto.idproducto){
                productosLS = productoLS.idproducto;
                 console.log("leer"+productoLS.idproducto);
            }
        }); 

        if(productosLS === infoProducto.idproducto){
        	//this.updateProducto(infoProducto);
            Swal.fire({
                type: 'info',
                title: 'Oops...',
                //text: 'El producto se actulizo correctamente',
                text: 'El producto ya está agregado. Ve al carrito de compras si deseas modificar la cantidad.',
                showConfirmButton: false,
                timer: 3000
            })
        }
        else {
            this.insertarCarrito(infoProducto);
        }
        
    }
  
   
    //muestra producto seleccionado en carrito
    insertarCarrito(producto){
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>
                <img src="${producto.imagen}" width=60>
            </td>
            <td colspan=4>${producto.nombre}<br>
                 Precio: S/. ${producto.precio}<br>
                 Cantidad: ${producto.cantidad}</td>
            <td colspan=2>S/. ${producto.precioTotal}</td>
            <td>
                <a href="#" class="borrar-producto fas fa-times-circle" data-id="${producto.idproducto}"></a>
            </td>
        `;
        listaProductos.appendChild(row);
        this.guardarProductosLocalStorage(producto);
        let productosLS;
        productosLS = this.obtenerProductosLocalStorage()
		document.getElementById('idCanProductos').innerText=productosLS.length;
    }

    //Eliminar el producto del carrito en el DOM
    eliminarProducto(e){
        e.preventDefault();
        let producto, productoID;
        if(e.target.classList.contains('borrar-producto')){
            producto = e.target.parentElement;
            productoID = producto.querySelector('a').getAttribute('data-id');
            e.target.parentElement.parentElement.remove();
            console.log(producto+":<>:"+productoID);
        }
        this.eliminarProductoLocalStorage(productoID);
        this.calcularTotal();

    }

    //Elimina todos los productos
    vaciarCarrito(e){
        e.preventDefault();
        while(listaProductos.firstChild){
            listaProductos.removeChild(listaProductos.firstChild);
        }
        this.vaciarLocalStorage();

        return false;
    }

    //Almacenar en el LS
    guardarProductosLocalStorage(producto){
        let productos;
        //Toma valor de un arreglo con datos del LS
        productos = this.obtenerProductosLocalStorage();
        //Agregar el producto al carrito
        productos.push(producto);
        //Agregamos al LS
        localStorage.setItem('productos', JSON.stringify(productos));
    }

    //Comprobar que hay elementos en el LS
    obtenerProductosLocalStorage(){
        let productoLS;

        //Comprobar si hay algo en LS
        if(localStorage.getItem('productos') === null){
            productoLS = [];
        }
        else {
            productoLS = JSON.parse(localStorage.getItem('productos'));
        }
        return productoLS;
    }

    //Mostrar los productos guardados en el LS
    leerLocalStorage(){
        let productosLS;
        productosLS = this.obtenerProductosLocalStorage();
       // alert('Hola'+productosLS.length);
       // $('#idCanProductos').text
        document.getElementById('idCanProductos').innerText=productosLS.length;
        productosLS.forEach(function (producto){
            //Construir plantilla
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>
                    <img src="${producto.imagen}" width=60>
                </td>
                <td colspan=4>${producto.nombre}<br>
                 Precio: S/. ${producto.precio}<br>
                 Cantidad: ${producto.cantidad}</td>
                 <td colspan=2>S/. ${producto.precioTotal}</td>
                <td>
                    <a href="#" class="borrar-producto fas fa-times-circle" data-id="${producto.idproducto}"></a>
                </td>
            `;
            listaProductos.appendChild(row);
        });
    }

    //Mostrar los productos guardados en el LS en compra.html
    leerLocalStorageCompra(){
        let productosLS;
        productosLS = this.obtenerProductosLocalStorage();
        productosLS.forEach(function (producto){
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>
                    <div class="img">
                        <img src="${producto.imagen}" alt="Image"/>
                        <p>${producto.nombre}</p>
                    </div>
                </td>
                <td>${producto.precio}</td>
                <td>
                    <div class="qty">
                        <button class="btn-minus fa fa-minus cantidad"></button>
                        <input type="text" class="form cantidad" min="1" value='${producto.cantidad}'>
                        <button class="btn-plus fa fa-plus cantidad"></button>
                    </div>
                    
                   
                </td>
                <td id='subtotales'>${producto.precio * producto.cantidad}</td>
                <td>
                    <a href="#" class="borrar-producto fas fa-times-circle" style="font-size:30px" data-id="${producto.idproducto}"></a>
                </td>
            `;
            listaCompra.appendChild(row);
        });
    }

    //Eliminar producto por ID del LS
    eliminarProductoLocalStorage(productoID){
        let productosLS;
        //Obtenemos el arreglo de productos
        productosLS = this.obtenerProductosLocalStorage();
        //console.log(productosLS);
        //Comparar el id del producto borrado con LS
        productosLS.forEach(function(productoLS, index){
        	//console.log(productoLS.idproducto+":"+productoID);
            if(productoLS.idproducto === productoID){
                productosLS.splice(index, 1);
            }
        });
		
        //console.log(productosLS);
        //Añadimos el arreglo actual al LS
        localStorage.setItem('productos', JSON.stringify(productosLS));
    }

    //Eliminar todos los datos del LS
    vaciarLocalStorage(){
        localStorage.clear();
    }

    //Procesar pedido
    procesarPedido(e){
        e.preventDefault();

        if(this.obtenerProductosLocalStorage().length === 0){
            Swal.fire({
                type: 'error',
                title: 'Oops...',
                text: 'El carrito está vacío, agrega algún producto',
                showConfirmButton: false,
                timer: 2000
            })
        }
        else {
            location.href = "verCarrito";
        }
    }

    //Calcular montos
    calcularTotal(){
        let productosLS;
        let total = 0, igv = 0, importe = 0, des=0;
        productosLS = this.obtenerProductosLocalStorage();
        for(let i = 0; i < productosLS.length; i++){
            let element = Number(productosLS[i].precio * productosLS[i].cantidad);
            importe = importe + element;
            
        }
        if(importe>500)
            des=parseFloat(importe * 0.05);
        igv = parseFloat(importe * 0.18);
        total = parseFloat(importe-des+igv);

        document.getElementById('idImporte').innerHTML = "S/. " + importe.toFixed(2);
        document.getElementById('idDescuento').innerHTML = "S/. " + des.toFixed(2);
        document.getElementById('idIGV').innerHTML = "S/. " + igv.toFixed(2);
        document.getElementById('idTotal').innerHTML = "S/. " + total.toFixed(2);
    }

    obtenerEvento(e) {
    	//alert("Hola");
        e.preventDefault();
        let id, cantidad, producto, productosLS;
        if (e.target.classList.contains('cantidad')) {
            producto = e.target.parentElement.parentElement.parentElement;
            console.log(producto);
            id = producto.querySelector('td a').getAttribute('data-id');
            console.log(id);
            if(producto.querySelector('div input').value<1)producto.querySelector('div input').value=1;
            cantidad = producto.querySelector('div input').value;
            
            let actualizarMontos = document.querySelectorAll('#subtotales');
            productosLS = this.obtenerProductosLocalStorage();
            productosLS.forEach(function (productoLS, index) {
                if (productoLS.idproducto === id) {
	            	//alert(productoLS.stock);
	                if(cantidad<=productoLS.stock){
	                //if(this.verificarStock(cantidad,productoLS.stock)){
	                    productoLS.cantidad = cantidad;    
	                    productoLS.precioTotal = cantidad * productosLS[index].precio;  
                    	actualizarMontos[index].innerHTML = Number(cantidad * productosLS[index].precio);                  
                	}else{
                		producto.querySelector('div input').value=productoLS.cantidad;
                		Swal.fire({
			                type: 'info',
			                title: 'Oops...',
			                //text: 'El producto se actulizo correctamente',
			                text: 'La cantidad solicitada sobrepasa al stock',
			                showConfirmButton: false,
			                timer: 1500
			            })
                	}
                }    
            });
            localStorage.setItem('productos', JSON.stringify(productosLS));
            this.calcularTotal();
            
        }
        else {
            console.log("click afuera");
        }
    }
    
    updateProducto(infoProducto){
    	alert(infoProducto.idproducto);
    	let cantidad;
        let productosLS;
        productosLS = this.obtenerProductosLocalStorage();
        console.log("Prueba1:"+productosLS);
         productosLS.forEach(function (productoLS){
            if(productoLS.idproducto === infoProducto.idproducto){
                productosLS.cantidad = infoProducto.cantidad;
                console.log(infoProducto.idproducto+":"+productoLS.cantidad);
            }
        }); 
        localStorage.setItem('productos', JSON.stringify(productosLS));
    }
}