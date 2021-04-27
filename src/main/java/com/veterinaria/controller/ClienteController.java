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
import com.veterinaria.entity.Rol;
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
	
	@RequestMapping("/registrarCliente")
	@ResponseBody
	public Map<String, Object> registraCliente (Usuario obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		//Usuario objSalida = null;
		try {
			/*Rol rol=new Rol();
			rol.setIdrol(1);
			obj.setIdrol(rol);*/
			//objSalida = clienteService.registrarCiente(obj);
			clienteService.registrarCiente(obj);
			/*if (objSalida == null) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			} else {
				Usuario u=clienteService.ultimoClienteRegistrado();
				salida.put("USUARIO",u);
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
				//return salida;
			}*/
			salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
			Usuario u=clienteService.ultimoClienteRegistrado();
			salida.put("USUARIO",u);
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
		}

		return salida;
}
	}