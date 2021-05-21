package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import com.veterinaria.entity.Opcion;
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Usuario;

public interface UsuarioService {
	
	//DISTRITO
	//public abstract List<Distrito> listaDistrito();
	
	//ROL
	public abstract List<Rol> listaRol();
	
	//USUARIO
	public abstract List<Usuario> listaUsuario();
	public abstract Usuario registraUsuario(Usuario bean);
	public abstract Optional<Usuario> buscaUsuarioPorId(int idusuario);
	public abstract Usuario buscarUsuarioXRol(int idusuario);
	public abstract void eliminaUsuario(int idusuario);
	public abstract List<Usuario> listaUsuarioPorRol(int idrol);
	
	public abstract Usuario login(Usuario bean);
	public abstract List<Usuario> verificarRegistro(Usuario bean);

	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);
	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);
	
	
	
	
	
	
}
