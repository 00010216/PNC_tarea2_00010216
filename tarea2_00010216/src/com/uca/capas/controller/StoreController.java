package com.uca.capas.controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Store;
import com.uca.capas.service.StoreService;

@Controller
public class StoreController {
	static Logger log = Logger.getLogger(MainController.class.getName());
	
	@Autowired
	StoreService storeSer;
	
	@RequestMapping(value = "/stores")
	public ModelAndView show() {
		ModelAndView mav = new ModelAndView();
		List<Store> stores = null;
		try {
			stores = storeSer.findAll();
			if(stores == null) {
				mav.setViewName("stores");
				mav.addObject("message","Error usuario no existe");
			}else{ 
			mav.setViewName("stores");
			mav.addObject("store",stores);
			}
		}catch(Exception e){
			mav.setViewName("stores");
			mav.addObject("message","Error");
		}
		return mav;
	}
	
	@RequestMapping(value = "/stores/delete/{code}")
	public ModelAndView delete(@PathVariable Integer code) {
		ModelAndView mav = new ModelAndView();
		try {
			storeSer.delete(code);
			
		}catch(Exception e){
			mav.addObject("message","Error");
			log.info("Error:" + e.toString());
		}
		mav.setViewName("redirect:/stores");
		return mav;
	}
	
	//Se manda a llamar la vista form y se le envia con los datos
	@RequestMapping(value = "/stores/edit/{code}")
	public ModelAndView edit(@PathVariable Integer code) {
		ModelAndView mav = new ModelAndView();
		Store store = null;
		try {
			store = storeSer.findOne(code);
		}catch(Exception e){
			log.info("Error:" + e.toString());
		}
		mav.addObject("store",store);
		mav.setViewName("storeform");
		return mav;
	}
	
	//Al guardar sucursal se regresa a la vista de la lista de sucursales
	@RequestMapping(value = "/save")
	public ModelAndView save(@ModelAttribute Store store) {
		ModelAndView mav = new ModelAndView();
		List<Store> stores = null;
		int valor_retorno=0;
		
		try {
			storeSer.save(store); // se va a service para guardar store en la base
		}catch(Exception e){
			log.info("Error:" + e.toString());
		}
		stores = storeSer.findAll();
		log.info(valor_retorno+"");
		mav.addObject("store",stores);
		mav.setViewName("stores");
		return mav;
	}
	
	@RequestMapping(value = "/addStore", method = RequestMethod.POST)
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("store",new Store());
		mav.setViewName("storeform");
		return mav;
	}
	
	@RequestMapping(value = "/stores/profile/{code}")
	public String show(@PathVariable Integer code, Model m) {
		//ModelAndView mav = new ModelAndView();
		Store store = null;
		try {
			store = storeSer.fetchStoreWithEmployeesById(code);
			m.addAttribute("store", store);
		}catch(Exception e){
			log.info("Error:" + e.toString());
		}
		//mav.addObject("store",store);
		//mav.setViewName("storeprofile");
		return "storeprofile";
	}
	
}
