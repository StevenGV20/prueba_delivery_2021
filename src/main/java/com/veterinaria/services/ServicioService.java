package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.veterinaria.entity.Servicio;

public interface ServicioService {

	public abstract List<Servicio> listaServicios();
	public abstract Servicio mantenerServicio(Servicio obj);
	public abstract Optional<Servicio> buscarServicioxID(int id);
	public abstract void eliminaServicio(int id);
	
	//SUBIR ARCHIVOS
	public abstract void guardarFotoServicio(MultipartFile file) throws Exception;
	
}
