package com.veterinaria.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.veterinaria.entity.DetallePedido;
import com.veterinaria.entity.DetallePedidoPK;
import com.veterinaria.entity.Pedido;
import com.veterinaria.entity.Seleccion;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.PedidoService;


@Controller
public class PedidoController {
	
	@Autowired
	private PedidoService pedidoService;
	
	/*
	@RequestMapping("/listaMisPedidos")
	@ResponseBody
	public List<Pedido> listaPedidosByCliente(HttpSession session){
		
		return lista;
	}*/
	
	@RequestMapping("/verMisPedidos")
	public String verMisPedidos(HttpSession session,HttpServletRequest request) {
		Usuario user=(Usuario)session.getAttribute("objUsuario");
		List<Pedido> lista= pedidoService.listaPedidoByCliente(user.getIdusuario());
		request.setAttribute("pedidos", lista);
		return "misPedidos";
	}
	
	@RequestMapping("/detallePedidoById")
	@ResponseBody
	public List<DetallePedido>  detallePedidoById(int id) {
		List<DetallePedido> lista=pedidoService.buscaDetallePedidoById(id);
		for(DetallePedido det:lista){
			System.out.println(det.getPedido().getIdpedido());
		}
		return lista;
	}
	
	
	@RequestMapping("/procesarCarrito")
	@ResponseBody
	public Map<String, Object> procesarCarrito(String carrito,HttpSession session)  {
		System.out.println(carrito);
		String producto = carrito;
	    Gson gson = new Gson();
	    Type lsitaProducto = new  TypeToken<List<Seleccion>>() {}.getType();
	    List<Seleccion> detalleJson = gson.fromJson(producto, lsitaProducto);
	    System.out.println(detalleJson.get(0));
	    System.out.println(detalleJson.get(0).getCantidad());
	    System.out.println(detalleJson.get(0).getPrecioTotal());
	   
	    List<DetallePedido> detalle=new ArrayList<DetallePedido>();
	    double imp=0,des=0,igv=0,mon=0;
	    for (Seleccion det : detalleJson) {
			DetallePedidoPK pk=new DetallePedidoPK();
			pk.setIdproducto(det.getIdproducto());
			
			DetallePedido dp=new DetallePedido();
			dp.setDetallePK(pk);
			dp.setCantidad(det.getCantidad());
			dp.setPrecioTotal(det.getPrecioTotal());
			imp+=det.getPrecioTotal();
			
			detalle.add(dp);
		}
	    System.out.println(imp);
		if(imp>500)
			des=0.05*imp;
		igv=imp*0.18;
		mon=imp+igv-des;
		System.out.println("IM:"+imp+"I:"+igv+"D:"+des+"M:"+mon);
		detalle.get(detalle.size()-1).setImporte(imp);
		detalle.get(detalle.size()-1).setDescuento(des);
		detalle.get(detalle.size()-1).setIgv(igv);
		detalle.get(detalle.size()-1).setMontoTotal(mon);
		
		System.out.println("ESTA BIEN HASTA AQUI");

	    Pedido pedido=new Pedido();
	    pedido.setCliente((Usuario) session.getAttribute("objUsuario"));
	    pedido.setEstado("PENDIENTE");
	    pedido.setDetalle(detalle);
	    
	    Pedido objIns=pedidoService.registraPedido(pedido);
	    //String salida="-1";
	    Map<String, Object> salida = new HashMap<String, Object>();
	    if(objIns!=null) {
	    	salida.put("mensaje", "Registro existoso");
	    }
	    
		return salida;
	}
}
