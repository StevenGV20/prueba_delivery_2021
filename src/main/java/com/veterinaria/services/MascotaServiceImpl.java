package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Especie;
import com.veterinaria.entity.Mascota;
import com.veterinaria.repository.EspecieRepository;
import com.veterinaria.repository.MascotaRepository;

@Service
public class MascotaServiceImpl implements MascotaService{

	@Autowired
	private MascotaRepository repository;
	
	@Autowired 
	private EspecieRepository esprepository;
		
	@Override
	public List<Especie> listaEspecie() {
		return esprepository.findAll();
	}
	
	@Override
	public List<Mascota> listaMascota() {
		return repository.findAll();
	}
	@Override
	public Mascota mantenerMascota(Mascota bean) {
		return repository.save(bean);
	}

	@Override
	public Optional<Mascota> buscaMascotaPorId(int idmascota) {
		return repository.findById(idmascota);
	}
}
