package com.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.entity.Country;
import com.service.CountryService;

@Controller
public class AdminForCountry {
	@Autowired
	private CountryService CS;
	
	@RequestMapping("/CountryCity")
	public String ShowAdminForCountryCity(Model model){
		model.addAttribute("country",new Country());
		return "CountryCity";
	}
	@RequestMapping(value = "/CountryCity", method = RequestMethod.POST)
	public String saveCountry(@ModelAttribute Country country){
		CS.saveCountry(country);
		return "redirect:/CountryCity";
	}
	
	
}
