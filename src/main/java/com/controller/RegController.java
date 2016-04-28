package com.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.entity.BDay;
import com.entity.BMounth;
import com.entity.BYear;
import com.entity.City;
import com.entity.Country;
import com.entity.NamePerson;
import com.entity.Person;
import com.entity.Sex;
import com.service.BDayService;
import com.service.BMounthService;
import com.service.BYearService;
import com.service.CityService;
import com.service.CountryService;
import com.service.NamePersonService;
import com.service.PersonService;
import com.service.Editors.BDayEditor;
import com.service.Editors.BMounthEditor;
import com.service.Editors.BYearEditor;
import com.service.Editors.CityEditor;
import com.service.Editors.CountryEditor;
import com.service.Editors.NamePersonEditor;
import com.service.Editors.SexEditor;

@Controller
@SessionAttributes(types = {NamePerson.class, Sex.class, Country.class , City.class,BYear.class,BMounth.class,BDay.class})
public class RegController 
{
	@Autowired
	private PersonService PS;
	@Autowired
	private CountryService CS;
	@Autowired
	private CityService CityS;
	@Autowired
	private NamePersonService NPS;
	@Autowired
	private BYearService BYS;
	@Autowired
	private BMounthService BMS;
	@Autowired
	private BDayService BDS;
	
	private Sex sex;
	@InitBinder
	protected void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(NamePerson.class,new NamePersonEditor(NPS));
		binder.registerCustomEditor(Sex.class,new SexEditor(sex));
		binder.registerCustomEditor(Country.class,new CountryEditor(CS));
		binder.registerCustomEditor(City.class,new CityEditor(CityS));
		binder.registerCustomEditor(BYear.class,new BYearEditor(BYS));
		binder.registerCustomEditor(BMounth.class,new BMounthEditor(BMS));
		binder.registerCustomEditor(BDay.class,new BDayEditor(BDS));
		
	}
	
	
	@RequestMapping(value="/registration1")
	public String showReg(Model model){
		model.addAttribute("user" ,new Person());
		model.addAttribute("BYears" ,BYS.getAll());
		model.addAttribute("BMounths" ,BMS.getAll());
		model.addAttribute("BDays" ,BDS.getAll());
		model.addAttribute("countries" ,CS.getAll());
		model.addAttribute("cities", CityS.getAll());
		model.addAttribute("sexs", Sex.values());
		return "registration1";
	}
	
	@RequestMapping(value = "/registration1", method = RequestMethod.POST)
	public String Reg(@Valid @ModelAttribute("user") Person person,BindingResult BR,Model model)
	{
		if(BR.hasErrors()){
			model.addAttribute("BYears" ,BYS.getAll());
			model.addAttribute("BMounths" ,BMS.getAll());
			model.addAttribute("BDays" ,BDS.getAll());
			model.addAttribute("countries" ,CS.getAll());
			model.addAttribute("cities", CityS.getAll());
			model.addAttribute("sexs", Sex.values());
			return "registration1";
		}
		PS.savePerson(person);
		return "redirect:/registration1";
	}
	
	
	@RequestMapping(value="/login")
	public String showLogin(Model model){
		model.addAttribute("user", new Person());
		return "login";
	}
}
