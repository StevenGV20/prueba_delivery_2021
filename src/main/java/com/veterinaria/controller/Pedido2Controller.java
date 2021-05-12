package com.veterinaria.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Consulta2;
import com.veterinaria.entity.Incidencia2;
import com.veterinaria.entity.Opcion;
import com.veterinaria.entity.Pedido2;
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.Consulta2Service;
import com.veterinaria.services.Incidencia2Service;
import com.veterinaria.services.Pedido2Service;
import com.veterinaria.services.UsuarioService;
import com.veterinaria.util.Constantes;

@Controller
public class Pedido2Controller {
	
	@Autowired
	private Pedido2Service servicio;
	

	@RequestMapping("/listaPedido2")
	@ResponseBody
	public List<Pedido2> listaPedido2(){
		List<Pedido2> listaPedido2= servicio.listaPedido2();
		return listaPedido2;
	}
	
	@RequestMapping("/buscaPedido2XID")
	@ResponseBody
	public Optional<Pedido2> buscaPedido2XID(int id){
		Optional<Pedido2> pedido= servicio.buscaPedido2PorId(id);
		return pedido;
	}
	
	/*
	@ResponseBody
	@RequestMapping("registroConsultas")
	public HashMap<String, Object>registrar(Consulta2 obj){
		HashMap<String, Object> salida = new HashMap<>();
		Consulta2 objSalida= servicio.registrarConsulta(obj);
		if(objSalida == null) {
			salida.put("MENSAJE","Registro erooneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		return salida;
	}*/
	
	@RequestMapping("/registroPedido")
	@ResponseBody
	public Map<String, Object> registroPedido (Pedido2 obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		//Usuario objSalida = null;
		try {
			
			Optional<Pedido2> option = servicio.buscaPedido2PorId(obj.getIdpedido());
			servicio.registrarPedido(obj);
			/*if (objSalida == null) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			} else {
				Usuario u=clienteService.ultimoClienteRegistrado();
				salida.put("USUARIO",u);
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
				//return salida;
			}*/
			if(!option.isPresent()) {
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
				Pedido2 u=servicio.ultimoPedido2Registrado();
				salida.put("USUARIO",u);				
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ACT_EXITOSO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", "Hubo un error en el proceso. Consulte con su administrador.");
		}

		return salida;
	}
	
	@RequestMapping("/eliminaPedido2")
	@ResponseBody
	public Map<String, Object> eliminaPedido2(int id){
		Map<String, Object> salida=new HashMap<String, Object>();
		Optional<Pedido2> option = servicio.buscaPedido2PorId(id);
		try {
			if(option.isPresent()) {
				servicio.eliminaPedido2(id);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		}finally {
			List<Pedido2> listaPedido2= servicio.listaPedido2();
			salida.put("lista", listaPedido2);
		}
		return salida;
	}
		
}
