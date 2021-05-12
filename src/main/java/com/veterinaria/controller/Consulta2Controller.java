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
import com.veterinaria.entity.Opcion;
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.Consulta2Service;
import com.veterinaria.services.UsuarioService;
import com.veterinaria.util.Constantes;

@Controller
public class Consulta2Controller {
	
	@Autowired
	private Consulta2Service servicio;
	

	@RequestMapping("/listaConsulta2")
	@ResponseBody
	public List<Consulta2> listaConsulta2(){
		List<Consulta2> listaConsulta2= servicio.listaConsulta2();
		return listaConsulta2;
	}
	
	@RequestMapping("/buscaConsulta2XID")
	@ResponseBody
	public Optional<Consulta2> buscaConsulta2XID(int id){
		Optional<Consulta2> consulta= servicio.buscaConsulta2PorId(id);
		return consulta;
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
	
	@RequestMapping("/registroConsultas")
	@ResponseBody
	public Map<String, Object> registroConsultas (Consulta2 obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		//Usuario objSalida = null;
		try {
			
			Optional<Consulta2> option = servicio.buscaConsulta2PorId(obj.getIdconsulta());
			servicio.registrarConsulta(obj);
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
				Consulta2 u=servicio.ultimoConsulta2Registrado();
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
	
	@RequestMapping("/eliminaConsulta2")
	@ResponseBody
	public Map<String, Object> eliminaConsulta2(int id){
		Map<String, Object> salida=new HashMap<String, Object>();
		Optional<Consulta2> option = servicio.buscaConsulta2PorId(id);
		try {
			if(option.isPresent()) {
				servicio.eliminaConsulta2(id);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		}finally {
			List<Consulta2> listaConsulta2= servicio.listaConsulta2();
			salida.put("lista", listaConsulta2);
		}
		return salida;
	}
		
}
