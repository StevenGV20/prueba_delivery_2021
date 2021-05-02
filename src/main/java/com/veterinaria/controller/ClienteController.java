package com.veterinaria.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Servicio;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.ClienteService;
import com.veterinaria.services.UsuarioService;
import com.veterinaria.util.Constantes;

@Controller
public class ClienteController {

	@Autowired
	private ClienteService clienteService;
	@Autowired
	private UsuarioService usuarioService;
	

	
	//METODOS GET DE LISTAS O CONSULTAS 
	@RequestMapping("/listaDistritos")
	@ResponseBody
	public List<Distrito> listaDistrito(){
		List<Distrito> listaDistrito= clienteService.listaDistrito();
		return listaDistrito;
	}
	
	@RequestMapping("/listaClientes")
	@ResponseBody
	public List<Usuario> listaClientes(){
		List<Usuario> listaClientes= clienteService.listaCliente();
		return listaClientes;
	}
	
	@RequestMapping("/registrarCliente")
	@ResponseBody
	public Map<String, Object> registraCliente (Usuario obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		//Usuario objSalida = null;
		try {
			
			Optional<Usuario> option = usuarioService.buscaUsuarioPorId(obj.getIdusuario());
			clienteService.registrarCiente(obj);
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
				Usuario u=clienteService.ultimoClienteRegistrado();
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
	
	@RequestMapping("/eliminaCliente")
	@ResponseBody
	public Map<String, Object> eliminaCliente(int id){
		Map<String, Object> salida=new HashMap<String, Object>();
		Optional<Usuario> option = usuarioService.buscaUsuarioPorId(id);
		try {
			if(option.isPresent()) {
				usuarioService.eliminaUsuario(id);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		}finally {
			List<Usuario> listaClientes= clienteService.listaCliente();
			salida.put("lista", listaClientes);
		}
		return salida;
	}
	
	
}