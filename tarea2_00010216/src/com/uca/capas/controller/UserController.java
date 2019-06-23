package com.uca.capas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.User;
import com.uca.capas.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userSer;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView verify(@RequestParam String username,@RequestParam String password) {
		ModelAndView mav = new ModelAndView();
		User user = null;
		try {
			user = userSer.findFirstByUsernameAndPassword(username,password);
			if(user == null) {
				mav.setViewName("main");
				mav.addObject("message","Error usuario no existe");
			}else{ 
			mav.setViewName("redirect:/stores");
			//mav.addObject("message","Stores");
			}
		}catch(Exception e){
			mav.setViewName("main");
			mav.addObject("message","Error");
		}
		return mav;
	}
}
