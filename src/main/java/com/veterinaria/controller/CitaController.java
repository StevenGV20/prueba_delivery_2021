package com.veterinaria.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.RollbackException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Cita;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.CitaService;
import com.veterinaria.util.Constantes;

@Controller
public class CitaController {
	@Autowired
	private CitaService citaService;
	
	@RequestMapping(value = "/mantenerCita")
	@ResponseBody
	public Map<String, Object> mantenerCita(Cita obj, HttpSession session){
		Map<String, Object> salida=new HashMap<String, Object>();
		Cita objSalida=null;
		try {
			Usuario cliente=(Usuario) session.getAttribute("objUsuario");
			Date dia=new Date();
			if(obj.getFechaAtencion().before(dia)) {
				salida.put("mensaje", "El dia no puede ser antes de hoy");
				salida.put("estado", false);
				return salida;
			}
			else if(obj.getHoraAtencion().before(dia)) {
				salida.put("mensaje", "La hora debe ser antes de la actual");
				return salida;
			}else {
				obj.setCliente(cliente);
				obj.setEstado("PENDIENTE");
				objSalida = citaService.mantenerCita(obj);
				if(objSalida==null)
					salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
				else
					salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);				
			}
		}catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			e.printStackTrace();
		}
		return salida;
	}
	
}
