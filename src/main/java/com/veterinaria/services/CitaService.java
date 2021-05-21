package com.veterinaria.services;

import java.util.List;

import com.veterinaria.entity.Cita;

public interface CitaService {

	public abstract List<Cita> listarCita();
	public abstract List<Cita> listarCitaByUsuario(int cod_usu);
	public abstract List<Cita> listarCitaByEstado(String estado);
	public abstract Cita mantenerCita(Cita bean);
	public abstract void eliminaCita(int codigo);
	
}
