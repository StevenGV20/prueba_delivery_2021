package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
	
	@Query("Select u from Usuario u where rol = :tipo")
	public abstract List<Usuario> listaAlumnoPorNombreLike(@Param("tipo") String tipo);
	
}
