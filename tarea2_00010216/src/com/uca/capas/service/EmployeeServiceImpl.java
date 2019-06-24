package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Employee;
import com.uca.capas.domain.Store;
import com.uca.capas.dto.EmployeeDTO;
import com.uca.capas.repositories.EmployeeRepository;
import com.uca.capas.repositories.StoreRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	EmployeeRepository empRep;
	
	@Autowired
	StoreRepository storeRep;

	@Override
	public List<Employee> findAll() throws DataAccessException {
		 return empRep.findAll();
	}

	@Override
	public EmployeeDTO findOne(Integer id) throws DataAccessException {
		 Employee e = empRep.findById(id).get();
		 EmployeeDTO employeeDTO = new EmployeeDTO(e.getCode(), e.getName(), e.getAge(), e.getGender(), e.isStatus(),e.getStoreId().getCode());
		 return employeeDTO;
	}

	@Override
	public Employee save(EmployeeDTO emp) throws DataAccessException {
		Store store = storeRep.findById(emp.getStoreid()).get();
		
		Employee employee = new Employee();
		employee.setCode(emp.getCode() != null ? emp.getCode() : null);
		employee.setName(emp.getName());
		employee.setAge(emp.getAge());
		employee.setGender(emp.getGender());
		employee.setStatus(emp.isStatus());
		employee.setStore(store);
		return empRep.save(employee);
	}

	@Override
	public void delete(int emp) throws DataAccessException {
		Employee employee = empRep.findById(emp).get();
		empRep.delete(employee);
	}

}
