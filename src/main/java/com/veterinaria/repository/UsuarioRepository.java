package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.Opcion;
import com.veterinaria.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
	
	
	@Query("Select u from Usuario u where u.idrol.idrol != 1")
	public abstract List<Usuario> listaPersonalTrabajo();
	
	@Query("Select x from Usuario x where x.correo = :#{#usu.correo} or x.dni = :#{#usu.dni}")
	public abstract List<Usuario> verificarRegistro(@Param(value = "usu") Usuario bean);
	
	@Query("Select x from Usuario x where x.correo = :#{#usu.correo} and x.password = :#{#usu.password}")
	public abstract Usuario login(@Param(value = "usu") Usuario bean);
	
	@Query("select o from Opcion o, Acceso a, Rol r, Usuario u "
			+ "where o.idopcion = a.opcion.idopcion and "
			+ "a.rol.idrol = r.idrol and "
			+ "u.idrol.idrol = r.idrol and "
			+ "u.idusuario = :var_idUsuario")
	public abstract List<Opcion> traerEnlacesDeUsuario(@Param("var_idUsuario") int idUsuario);
	
}
