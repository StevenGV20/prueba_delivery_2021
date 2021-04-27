package com.veterinaria.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Usuario;
import com.veterinaria.repository.ClienteRepository;
import com.veterinaria.repository.DistritoRepository;

@Service
public class ClienteServiceImpl implements ClienteService {

	@Autowired
	private ClienteRepository repository;
	
	@Autowired 
	private DistritoRepository disrepository;
		
	@Override
	public List<Distrito> listaDistrito() {
		return disrepository.findAll();
	}
	
	@Override
	public Usuario registrarCiente(Usuario bean) {
		Rol objRol = new Rol();
		objRol.setIdrol(1);
		bean.setIdrol(objRol);
		return repository.save(bean);
	}

	@Override
	public Usuario ultimoClienteRegistrado() {
		return repository.listarUltimoUsuarioRegistrado().orElse(null);
	}
	
}
