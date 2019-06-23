package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Store;
import com.uca.capas.repositories.StoreRepository;

@Service
public class StoreServiceImplementation implements StoreService{

	@Autowired
	StoreRepository storeRep;

	@Override
	public List<Store> findAll() throws DataAccessException {
		return storeRep.findAll();
	}

	@Override
	public Store findOne(Integer id) throws DataAccessException {
		return storeRep.findById(id).get();
	}

	@Override
	public void delete(Integer id) throws DataAccessException {
		Store s = findOne(id);
		storeRep.delete(s);
	}
	
	
}
