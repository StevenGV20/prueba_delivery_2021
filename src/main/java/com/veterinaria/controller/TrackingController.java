package com.veterinaria.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.DetallePedidoUsuario;
import com.veterinaria.entity.Tracking;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.PedidoService;
import com.veterinaria.services.TrackingService;
import com.veterinaria.util.Constantes;

@Controller
public class TrackingController {
	
	@Autowired
	private PedidoService pedidoService;
	
	@Autowired
	private TrackingService trackingService;
	
	
	@RequestMapping("/verMisPedidos")
	public String verMisPedidos(HttpSession session,HttpServletRequest request) {
		Usuario user=(Usuario)session.getAttribute("objUsuario");
		if(user.getIdrol().getIdrol()<2) {
			List<Tracking> lista= trackingService.listaTrackingByCliente(user.getIdusuario());
			request.setAttribute("pedidos", lista);
		}else if(user.getIdrol().getIdrol()<4) {
			List<Tracking> lista=trackingService.listaAllTracking();
			request.setAttribute("pedidos", lista);
		}else if(user.getIdrol().getIdrol()==4) {
			List<Tracking> lista=trackingService.listaTrackingByTrabajador(user.getIdusuario());
			request.setAttribute("pedidos", lista);
		}
		return "misPedidos";
	}
	
	
	
	@RequestMapping("/consultarTracking")
	public String consultarTracking(int cod,HttpServletRequest request) {
		if(!(cod+"").matches("[0-9]{1,}")) {
			System.out.println("HOLASSS");
			return "redirect:/";			
		}
		else {
			Tracking track=trackingService.buscaTrackinByPedido(cod).get();
			List<DetallePedidoUsuario> historial=trackingService.buscarHistorialPedido(cod);
			request.setAttribute("tracking", track);
			request.setAttribute("historial", historial);
			return "pedidoTracking";
		}
			
	}
	
	@RequestMapping("/asignaTrabajador")
	public String asignaTrabajador(Tracking bean,HttpSession session){
		Map<String, Object> salida=new HashMap<String, Object>();
		//Optional<Track> option=service.buscaUsuarioPorId(id);
		try {
			System.out.println(bean.getPedido().getIdpedido());
			Usuario usu=(Usuario) session.getAttribute("objUsuario");
			trackingService.asignaTrabajador(bean,usu);
			salida.put("mensaje","Se asingo al trabajador correctamente");
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", "Hubo un error en el proceso");
		}finally {
		}
		return "redirect:/verMisPedidos";
	}
	

	@RequestMapping("/registraEntrega")
	public String registraEntrega(Tracking bean,HttpSession session){
		Map<String, Object> salida=new HashMap<String, Object>();
		//Optional<Track> option=service.buscaUsuarioPorId(id);
		try {
			System.out.println(bean.getPedido().getIdpedido());
			Usuario usu=(Usuario) session.getAttribute("objUsuario");
			bean.setTrabajador(usu);
			bean.setEstado("ENTREGADO");
			bean.setFechaEntrega(new Date());
			bean.setHoraEntrega(new Date());
			trackingService.registrarEntrega(bean);
			salida.put("mensaje","Se asingo al trabajador correctamente");
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", "Hubo un error en el proceso");
		}finally {
		}
		return "redirect:/verMisPedidos";
	}
	
	
}
