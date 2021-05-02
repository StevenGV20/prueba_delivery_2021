package com.veterinaria.services;
import java.util.List;
import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Usuario;

public interface ClienteService {

	//DISTRITO
	public abstract List<Distrito> listaDistrito();
	
	public abstract Usuario registrarCiente(Usuario bean);
	public abstract Usuario ultimoClienteRegistrado();
	
	/*public abstract Usuario buscarUsuarioByID(int id);
	public abstract void eliminaUsuario(int id);*/
	public abstract List<Usuario> listaCliente();

}
