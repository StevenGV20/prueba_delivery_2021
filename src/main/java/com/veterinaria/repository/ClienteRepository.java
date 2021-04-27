package com.veterinaria.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import com.veterinaria.entity.Usuario;

public interface ClienteRepository extends JpaRepository<Usuario, Integer>{

	@Query(value = "{call sp_ultimoUsuarioRegistrado()}",nativeQuery = true)
	public abstract Optional<Usuario> listarUltimoUsuarioRegistrado();
}
