package com.veterinaria.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.ClienteService;
import com.veterinaria.util.Constantes;

@Controller
public class ClienteController {

	@Autowired
	private ClienteService clienteService;

	
	//METODOS GET DE LISTAS O CONSULTAS 
	@RequestMapping("/listaDistritos")
	@ResponseBody
	public List<Distrito> listaDistrito(){
		List<Distrito> listaDistrito= clienteService.listaDistrito();
		return listaDistrito;
	}
	
	@PostMapping("/registrarCliente")
	public String registraCliente (Usuario obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		Usuario objSalida = null;
		try {
			objSalida = clienteService.registrarCiente(obj);
			if (objSalida == null) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			} else {
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
				return "redirect:/verLogin";
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
		}

		return "redirect:/";
}
	}