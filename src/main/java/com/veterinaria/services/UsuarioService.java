package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Trabajador;
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
	
	//TRABAJADOR
	public abstract Trabajador mantenerTrabajador(Trabajador bean);
	
	
	
	
	
	
}
