package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import com.veterinaria.entity.Distrito;
//import com.veterinaria.entity.Rol;
//import com.veterinaria.entity.Usuario;
import com.veterinaria.entity.Consulta2;
import com.veterinaria.entity.Incidencia2;
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Usuario;
import com.veterinaria.repository.Consulta2Repository;
import com.veterinaria.repository.Incidencia2Repository;
//import com.veterinaria.repository.DistritoRepository;

@Service
public class Incidencia2ServiceImpl implements Incidencia2Service {

	@Autowired
	private Incidencia2Repository repository;
	/*
	@Autowired 
	private DistritoRepository disrepository;*/
	/*	
	@Override
	public List<Distrito> listaDistrito() {
		return disrepository.findAll();
	}*/
	
	@Override
	public Incidencia2 registrarIncidencia(Incidencia2 obj) {
		Rol objRol = new Rol();
		objRol.setIdrol(1);
		obj.setIdrol(objRol);
		return repository.save(obj);
	}
	
	@Override
	public List<Incidencia2> listaIncidencia2() {
		return repository.listaIncidencia2();
	}
	
	@Override
	public Incidencia2 ultimoIncidencia2Registrado() {
		return repository.listarUltimoIncidencia2Registrado().orElse(null);
	}
	
	@Override
	public Optional<Incidencia2> buscaIncidencia2PorId(int idincidencia) {
		
		return repository.findById(idincidencia);
	}
	
	@Override
	public void eliminaIncidencia2(int idincidencia) {
		repository.deleteById(idincidencia);
		
	}
/*
	@Override
	public Usuario ultimoClienteRegistrado() {
		return repository.listarUltimoUsuarioRegistrado().orElse(null);
	}

	@Override
	public List<Usuario> listaCliente() {
		return repository.listaClientes();
	}*/

	
}
