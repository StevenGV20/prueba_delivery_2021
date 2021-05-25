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

import com.veterinaria.entity.Cita;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.CitaService;
import com.veterinaria.util.Constantes;

@Controller
public class CitaController {
	@Autowired
	private CitaService citaService;
	
	@RequestMapping("/listAll")
	@ResponseBody
	public List<Cita> listAll(){
		List<Cita> lista= citaService.listarCita();
		return lista;
	}
	
	@RequestMapping("/buscaCitaById")
	@ResponseBody
	public Optional<Cita> buscaCitaById(int cod){
		Optional<Cita> lista= citaService.listarCitaById(cod);
		return lista;
	}
	
	@RequestMapping("/verCitas")
	public String verMisPedidos(HttpSession session,HttpServletRequest request) {
		Usuario user=(Usuario)session.getAttribute("objUsuario");
		if(user.getIdrol().getIdrol()<2) {
			List<Cita> lista= citaService.listarCitaByCliente(user.getIdusuario());
			request.setAttribute("citas", lista);
		}else if(user.getIdrol().getIdrol()<4) {
			List<Cita> lista=citaService.listarCita();
			request.setAttribute("citas", lista);
		}else if(user.getIdrol().getIdrol()==5) {
			List<Cita> lista=citaService.listarCitaByVeterinari(user.getIdusuario());
			request.setAttribute("citas", lista);
		}
		return "listaCitas";
	}
	
	
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
	
	@RequestMapping("/asignaVeterinario")
	public String asignaTrabajador(Cita bean,HttpSession session){
		Map<String, Object> salida=new HashMap<String, Object>();
		//Optional<Track> option=service.buscaUsuarioPorId(id);
		try {
			//System.out.println(bean.getPedido().getIdpedido());
			//Usuario usu=(Usuario) session.getAttribute("objUsuario");
			/*Date dia=bean.getFechaAtencion();
			Date hora=bean.getHoraAtencion();
			bean.setFechaAtencion(dia);
			bean.setHoraAtencion(hora);*/
			bean.setEstado("APROBADO");
			citaService.mantenerCita(bean);
			salida.put("mensaje","Se asingo al trabajador correctamente");
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", "Hubo un error en el proceso");
		}finally {
		}
		return "redirect:/verCitas";
	}
	
}
