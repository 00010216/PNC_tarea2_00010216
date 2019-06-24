package com.uca.capas.service;


import java.util.List;
import org.springframework.dao.DataAccessException;
import com.uca.capas.domain.Employee;
import com.uca.capas.dto.EmployeeDTO;

public interface EmployeeService {
	public List<Employee> findAll() throws DataAccessException;
	
	public EmployeeDTO findOne(Integer id) throws DataAccessException;
	
	public Employee save(EmployeeDTO emp) throws DataAccessException;
	
	public void delete(int emp) throws DataAccessException;
}
