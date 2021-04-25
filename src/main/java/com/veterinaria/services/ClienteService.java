package com.veterinaria.services;
import java.util.List;
import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Usuario;

public interface ClienteService {

	//DISTRITO
	public abstract List<Distrito> listaDistrito();
	
	public abstract Usuario registrarCiente(Usuario bean);

}
