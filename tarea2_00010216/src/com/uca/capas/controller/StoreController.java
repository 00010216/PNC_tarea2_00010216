package com.uca.capas.controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
