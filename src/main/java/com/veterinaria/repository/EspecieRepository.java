package com.veterinaria.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.veterinaria.entity.Especie;

public interface EspecieRepository extends JpaRepository<Especie, Integer>{

}
