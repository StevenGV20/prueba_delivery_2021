package com.veterinaria.controller;

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

import com.veterinaria.entity.Especie;
import com.veterinaria.entity.Mascota;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.MascotaService;
import com.veterinaria.util.Constantes;

@Controller
public class MascotaController {

	@Autowired
	private MascotaService mascotaService;
	
	//METODOS GET DE LISTAS O CONSULTAS 
		@RequestMapping("/listaEspecies")
		@ResponseBody
		public List<Especie> listaEspecie(){
			List<Especie> listaEspecie= mascotaService.listaEspecie();
			return listaEspecie;
		}
		
		@RequestMapping("/listaMascotas")
		@ResponseBody
		public List<Mascota> listaMascotas(){
			List<Mascota> lista= mascotaService.listaMascota();
			return lista;
		}
		
		@RequestMapping("/listaMascotasByCliente")
		@ResponseBody
		public List<Mascota> listaMascotasByCliente(int cod){
			List<Mascota> lista= mascotaService.listaMascotaByCliente(cod);
			return lista;
		}
		
		@RequestMapping("/verMascotasByCliente")
		public String verMascotasByCliente(int cod,HttpServletRequest request) {
			List<Mascota> lista= mascotaService.listaMascotaByCliente(cod);
			request.setAttribute("mascotas", lista);
			request.setAttribute("codCliente", cod);
			return "misMascotas";
		}
		
		@RequestMapping("/verMisMascotas")
		public String verCrudMascotas(HttpSession session,HttpServletRequest request) {
			Usuario usu=(Usuario) session.getAttribute("objUsuario");
			List<Mascota> lista= mascotaService.listaMascotaByCliente(usu.getIdusuario());
			request.setAttribute("mascotas", lista);
			request.setAttribute("codCliente", usu.getIdusuario());
			return "misMascotas";
		}
		
		@RequestMapping("/buscarMascotaById")
		@ResponseBody
		public Optional<Mascota> buscarMascotaById(int cod){
			Optional<Mascota> mascota= mascotaService.buscaMascotaPorId(cod);
			return mascota;
		}
		
		
		/*@PostMapping("/registrarMascota")
		public String registraMascota (Mascota obj){
			Map<String, Object> salida = new HashMap<String, Object>();
			Mascota objSalida = null;
			try {
				objSalida = mascotaService.registrarMascota(obj);
				if (objSalida == null) {
					salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
				} else {
					salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
					return "redirect:/verCrudMascotas";
				}
			} catch (Exception e) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			}

			return "redirect:/";
}*/
		
		//METODOS PARA CRUD
	
		@RequestMapping("/registrarMascota")
		@ResponseBody
		public Map<String, Object> registraMascota (Mascota obj){
			Map<String, Object> salida = new HashMap<String, Object>();
			Mascota objSalida = null;
			try {
				Optional<Mascota> option=mascotaService.buscaMascotaPorId(obj.getIdmascota());
				if(!option.isPresent()) {
					objSalida = mascotaService.mantenerMascota(obj);
					if (objSalida == null) {
						salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
					}else {
						salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
					}					
				}else {
					objSalida = mascotaService.mantenerMascota(obj);
					salida.put("mensaje", Constantes.MENSAJE_ACT_EXITOSO);
				}
					
			} catch (Exception e) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			}

			return salida;
		}
	
		
		@RequestMapping("/eliminaMascota")
		@ResponseBody
		public Map<String, Object> eliminaMascota(int id){
			Map<String, Object> salida=new HashMap<String, Object>();
			Optional<Mascota> option=mascotaService.buscaMascotaPorId(id);
			try {
				if(option.isPresent()) {
					mascotaService.eliminaMascota(id);
					salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
				}else {
					salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);
				}
			} catch (Exception e) {
				salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
			}finally {
				List<Mascota> lista=mascotaService.listaMascotaByCliente(option.get().getCliente().getIdusuario());
				salida.put("lista", lista);
			}
			return salida;
		}
		
			

		
		
}
