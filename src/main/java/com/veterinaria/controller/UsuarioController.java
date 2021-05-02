package com.veterinaria.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.UsuarioService;
import com.veterinaria.util.Constantes;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioService service;
	
	//METODOS GET DE LISTAS O CONSULTAS 
	
		@RequestMapping("/listaUsuarios")
		@ResponseBody
		public List<Usuario> listaUsuarios(){
			List<Usuario> lista= service.listaUsuario();
			return lista;
		}
		@RequestMapping("/listaRol")
		@ResponseBody
		public List<Rol> listaRol(){
			List<Rol> lista= service.listaRol();
			return lista;
		}
		
		@RequestMapping("/buscaUsuarioXID")
		@ResponseBody
		public Optional<Usuario> buscaUsuarioXID(int id){
			Optional<Usuario> usuario= service.buscaUsuarioPorId(id);
			return usuario;
		}
		
		@RequestMapping("/registrarUsuario")
		@ResponseBody
		public Map<String, Object> registrarUsuario (Usuario obj){
			Map<String, Object> salida = new HashMap<String, Object>();
			Usuario objSalida = null;
			try {
				objSalida = service.registraUsuario(obj);
				if (objSalida == null) {
					salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
				}else {
						salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
						//return "redirect:/url";
				}
			} catch (Exception e) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			}

			return salida;
        }
		
		@RequestMapping("/actualizaUsuario")
		@ResponseBody
		public Map<String, Object> actualizaUsuario(Usuario bean){
			Map<String, Object> salida=new HashMap<String, Object>();
			Optional<Usuario> option =service.buscaUsuarioPorId(bean.getIdusuario());
			try {
				if(option.isPresent()) {
					Usuario objSalida= service.registraUsuario(bean);
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
				List<Usuario> lista = service.listaUsuario();
				salida.put("lista", lista);
			}
			return salida;
		}
		
		@RequestMapping("/eliminaUsuario")
		@ResponseBody
		public Map<String, Object> eliminaUsuario(int id){
			Map<String, Object> salida=new HashMap<String, Object>();
			Optional<Usuario> option=service.buscaUsuarioPorId(id);
			try {
				if(option.isPresent()) {
					service.eliminaUsuario(id);
					salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
				}else {
					salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);
				}
			} catch (Exception e) {
				salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
			}finally {
				List<Usuario> lista=service.listaUsuario();
				salida.put("lista", lista);
			}
			return salida;
		}
}
