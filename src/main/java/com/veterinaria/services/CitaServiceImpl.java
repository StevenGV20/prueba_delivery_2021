package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Cita;
import com.veterinaria.repository.CitaRespository;

@Service
public class CitaServiceImpl implements CitaService{

	@Autowired
	private CitaRespository repository;
	
	@Override
	public List<Cita> listarCita() {
		return repository.findAll();
	}

	@Override
	public List<Cita> listarCitaByUsuario(int cod_usu) {
		return null;
	}

	@Override
	public List<Cita> listarCitaByEstado(String estado) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cita mantenerCita(Cita bean) {
		return repository.save(bean);
	}

	@Override
	public void eliminaCita(int codigo) {
		repository.deleteById(codigo);
	}

	@Override
	public List<Cita> listarCitaByCliente(int cod_usu) {
		return repository.listaCitaByCliente(cod_usu);
	}

	@Override
	public List<Cita> listarCitaByVeterinari(int cod_usu) {
		return repository.listaCitaByVeterinario(cod_usu);
	}

	@Override
	public Optional<Cita> listarCitaById(int cod) {
		return repository.findById(cod);
	}

}
