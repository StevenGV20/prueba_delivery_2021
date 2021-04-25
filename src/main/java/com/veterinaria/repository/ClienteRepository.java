package com.veterinaria.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.veterinaria.entity.Usuario;

public interface ClienteRepository extends JpaRepository<Usuario, Integer>{

	
}
