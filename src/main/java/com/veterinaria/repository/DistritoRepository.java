package com.veterinaria.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.veterinaria.entity.Distrito;

public interface DistritoRepository extends JpaRepository<Distrito, Integer> {
	
}
