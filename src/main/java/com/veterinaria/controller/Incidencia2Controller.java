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
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.Consulta2Service;
import com.veterinaria.services.Incidencia2Service;
import com.veterinaria.services.UsuarioService;
import com.veterinaria.util.Constantes;

@Controller
public class Incidencia2Controller {
	
	@Autowired
	private Incidencia2Service servicio;
	

	@RequestMapping("/listaIncidencia2")
	@ResponseBody
	public List<Incidencia2> listaIncidencia2(){
		List<Incidencia2> listaIncidencia2= servicio.listaIncidencia2();
		return listaIncidencia2;
	}
	
	@RequestMapping("/buscaIncidencia2XID")
	@ResponseBody
	public Optional<Incidencia2> buscaIncidencia2XID(int id){
		Optional<Incidencia2> incidencia= servicio.buscaIncidencia2PorId(id);
		return incidencia;
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
	
	@RequestMapping("/registroIncidencia")
	@ResponseBody
	public Map<String, Object> registroIncidencia (Incidencia2 obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		//Usuario objSalida = null;
		try {
			
			Optional<Incidencia2> option = servicio.buscaIncidencia2PorId(obj.getIdincidencia());
			servicio.registrarIncidencia(obj);
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
				Incidencia2 u=servicio.ultimoIncidencia2Registrado();
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
	
	@RequestMapping("/eliminaIncidencia2")
	@ResponseBody
	public Map<String, Object> eliminaIncidencia2(int id){
		Map<String, Object> salida=new HashMap<String, Object>();
		Optional<Incidencia2> option = servicio.buscaIncidencia2PorId(id);
		try {
			if(option.isPresent()) {
				servicio.eliminaIncidencia2(id);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		}finally {
			List<Incidencia2> listaIncidencia2= servicio.listaIncidencia2();
			salida.put("lista", listaIncidencia2);
		}
		return salida;
	}
		
}
