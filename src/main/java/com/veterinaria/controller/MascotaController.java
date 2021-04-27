package com.veterinaria.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Especie;
import com.veterinaria.entity.Mascota;

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
				objSalida = mascotaService.mantenerMascota(obj);
				if (objSalida == null) {
					salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
				}else {
						salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
						//return "redirect:/verCrudMascotas";
				}
			} catch (Exception e) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			}

			return salida;
}
	
		/*@RequestMapping("/actualizaMascota")
		@ResponseBody
		public Map<String, Object> actualizaMascota(Mascota bean){
			Map<String, Object> salida=new HashMap<String, Object>();
			Optional<Mascota> option = mascotaService.buscaMascotaPorId(bean.getIdmascota());
			try {
				if(option.isPresent()) {
					Producto objSalida= service.mantenerProducto(bean);
					if(objSalida == null) {
						salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
					}else {
						salida.put("mensaje", Constantes.MENSAJE_ACT_EXITOSO);
					}
				}else {
					salida.put("mensaje", Constantes.MENSAJE_ACT_NO_EXISTE_ID);
				}			
			} catch (Exception e) {
				salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
			}finally {
				List<Producto> lista = service.listaProducto();
				salida.put("lista", lista);
			}
			return salida;
		}*/
		
			

		
		
}
