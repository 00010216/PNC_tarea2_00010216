package com.uca.capas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.User;
import com.uca.capas.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRep;

	@Override
	public User findFirstByUsernameAndPassword(String username, String password) throws DataAccessException {
		return userRep.findFirstByUsernameAndPassword(username, password);
	}

}
