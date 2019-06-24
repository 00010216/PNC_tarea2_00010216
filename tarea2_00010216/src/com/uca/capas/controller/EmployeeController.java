package com.uca.capas.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.uca.capas.domain.Store;
import com.uca.capas.dto.EmployeeDTO;
import com.uca.capas.repositories.EmployeeRepository;
import com.uca.capas.repositories.StoreRepository;
import com.uca.capas.service.EmployeeService;
import com.uca.capas.service.StoreService;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService empSer;
	
	@Autowired
	StoreService storeSer;
	
	@ModelAttribute("store")
	public List<Store> storeList(){
		List<Store> stores = new ArrayList<>();
		try {
			stores = storeSer.findAll();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return stores;
	}
	
	@RequestMapping(path = "/addEmployee", method = RequestMethod.POST)
	public ModelAndView employeeForm(@RequestParam("storecode") Integer id_store, HttpServletRequest req, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("action", "Agregar");
			mav.addObject("id_store",id_store);
			EmployeeDTO e = new EmployeeDTO();
			e.setStoreid(id_store);
			e.setGender("M");
			e.setStatus(true);
			mav.addObject("employeeDTO", e);
			mav.setViewName("employeeform");
		}
		catch(Exception e) {
			e.printStackTrace();
			RedirectView rv = new RedirectView(req.getContextPath()+"/stores/profile/"+id_store);
			rv.setExposeModelAttributes(false);
			ra.addFlashAttribute("error", "Algo salió mal, intentelo mas tarde.");
			mav.setView(rv);
		}
		return mav;
	}
	
	@RequestMapping(path="/save", method = RequestMethod.POST)
	public ModelAndView saveStore(@Valid @ModelAttribute("employeeDTO") EmployeeDTO employeeDTO, BindingResult result, RedirectAttributes ra,HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.addObject("action", "Agregar");
			mav.addObject("employeeDTO", employeeDTO);
			mav.setViewName("employeeform");
		} else {
			try {
				empSer.save(employeeDTO);
				RedirectView rv = new RedirectView(req.getContextPath()+"/stores/profile/"+employeeDTO.getStoreid());
				rv.setExposeModelAttributes(false);
				ra.addFlashAttribute("message", "Empleado guardado con éxito");
				mav.setView(rv);
			}
			catch(Exception e) {
				mav.addObject("message", "No se ha podido guardar el empleado, intente más tarde");
				mav.setViewName("employeeform");
				e.printStackTrace();
			}
		}
		return mav;
	}
	
	@RequestMapping("/employee/edit/{code}")
	public String editStore(@PathVariable Integer code, Model m){
		try {
			EmployeeDTO e = empSer.findOne(code);
			m.addAttribute("action", "Editar");
			m.addAttribute("employeeDTO", e);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "employeeform";
	}
	
	@GetMapping("/employee/delete/{code}")
	public RedirectView deleteStore(@PathVariable Integer code, HttpServletRequest req, RedirectAttributes ra) {
		int storeid = empSer.findOne(code).getStoreid();
		RedirectView rv = new RedirectView(req.getContextPath()+"/stores/profile/"+storeid);
		rv.setExposeModelAttributes(false);
		try {
			empSer.delete(code);
			ra.addFlashAttribute("success", true);
			ra.addFlashAttribute("message", "El empleado fue removido con éxito");			
		} catch (Exception e) {
			ra.addFlashAttribute("success", false);
			ra.addFlashAttribute("message", "No se pudo remover al empleado");
			e.printStackTrace();
		}
		return rv;
	}
}
