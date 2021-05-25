package com.veterinaria.services;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.veterinaria.entity.DetallePedido;
import com.veterinaria.entity.DetallePedidoUsuario;
import com.veterinaria.entity.DetallePedidoUsuarioPK;
import com.veterinaria.entity.Pedido;
import com.veterinaria.entity.Seleccion;
import com.veterinaria.entity.Tracking;
import com.veterinaria.repository.DetallePedidoRepository;
import com.veterinaria.repository.DetallePedidoUsuarioRepository;
import com.veterinaria.repository.PedidoRepository;
import com.veterinaria.repository.TrackingRepository;

@Service
public class PedidoServiceImpl implements PedidoService {

	@Autowired
	private PedidoRepository pedidoRepository;
	
	@Autowired
	private DetallePedidoRepository detalleRepository;
	
	@Autowired
	private TrackingRepository trackingRespository;
	
	@Autowired
	private DetallePedidoUsuarioRepository historialPedidoRepository;
	
	@Override
	@Transactional
	public Pedido registraPedido(Pedido bean,List<DetallePedido> detalle) {
		
		Pedido obj=pedidoRepository.save(bean);
		//System.out.println("LEYENDO OBJ SERVICE:"+obj.getEstado());
		System.out.println("LEYENDO OBJ SERVICEID:"+obj.getIdpedido());
		int id=obj.getIdpedido();
		for(DetallePedido det:detalle) {
			System.out.println("ID_DET:"+id);
			det.getDetallePK().setIdpedido(id);
			//System.out.println("ID_DET_2:"+det.getPedido().getIdpedido());
			System.out.println("ID_DET_2:"+det.getDetallePK().getIdpedido());
			detalleRepository.actualizaStock(det.getCantidad(), det.getDetallePK().getIdproducto());
			detalleRepository.save(det);
		}
		Tracking tr=new Tracking();
		tr.setEstado("PENDIENTE");
		tr.setPedido(obj);
		trackingRespository.save(tr);
		
		System.out.println("ID_PEDIDO:"+obj.getIdpedido());
		System.out.println("ID_CLIENTE:"+obj.getCliente().getIdusuario());
		DetallePedidoUsuario historialP=new DetallePedidoUsuario();
		DetallePedidoUsuarioPK dupk=new DetallePedidoUsuarioPK();
		dupk.setIdpedido(obj.getIdpedido());
		dupk.setIdusuario(obj.getCliente().getIdusuario());
		historialP.setUsuario(obj.getCliente());
		historialP.setPedido(obj);
		historialP.setDetallePK(dupk);
		historialP.setEstado("REGISTRADO Y PENDIENTE");
		historialPedidoRepository.save(historialP);
		
		return obj;
	}
 
	@Override
	public List<Pedido> listaPedido() {
		return pedidoRepository.findAll();
	}

	@Override
	public List<Pedido> listaPedidoByCliente(int usu) {
		return pedidoRepository.listaPedidoByCliente(usu);
	}
/*
	@Override
	public List<Pedido> listaPedidoByEstado(String estado) {
		return pedidoRepository.listaPedidoByEstado(estado);
	}*/

	@Override
	public Pedido updateEstadoPedido(Pedido bean) {
		return null;
	}

	@Override
	public List<DetallePedido> buscaDetallePedidoById(int id) {
		return detalleRepository.buscaDetallePedidoById(id);
	}

	@Override
	public List<Pedido> listaDetallePedidoByCod(int id) {
		return pedidoRepository.listaDetallePedidoByCod(id);
	}

	@Override
	public List<Seleccion> buscaBoletaxid(int id) {
		return detalleRepository.buscaBoletaById(id);
	}

	@Override
	public Optional<Pedido> buscaPedidoById(int cod) {
		return pedidoRepository.findById(cod);
	}

	@Override
	public List<Pedido> listaPedidoByEstado(String estado) {
		// TODO Auto-generated method stub
		return null;
	}

}
