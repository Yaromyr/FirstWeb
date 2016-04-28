package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.entity.City;
import com.entity.Country;
import com.service.CityService;
import com.service.CountryService;
import com.service.Editors.CountryEditor;

@Controller
@SessionAttributes(types= Country.class)
public class AdminForCity {

	@Autowired
	private CityService CS;
	
	@Autowired
	private CountryService CountryR;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(Country.class,new CountryEditor(CountryR));
	}
	
	@RequestMapping("/CityCountry")
	public String ShowAdminForCountryCity(Model model){
		model.addAttribute("countries", CountryR.getAll());
		model.addAttribute("city", new City());
		return "CityCountry";
	}
	
	@RequestMapping(value = "/CityCountry", method = RequestMethod.POST)
	public String saveCountry(@ModelAttribute City city){
		CS.saveCity(city);
		return "redirect:/CityCountry";
	}
}
