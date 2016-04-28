package com.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.NamePersonService;

@Controller
public class NamePersonController {
	@Autowired
	private NamePersonService NPS;
	@RequestMapping(value="/NamePerson")
	public String show(Model model){
		model.addAttribute("namePersons",NPS.getAll());
		return "NamePerson";
	}
	@RequestMapping(value = "/NamePerson", method = RequestMethod.POST)
	public String save(@RequestParam String name){
		NPS.save(name);
		return "redirect:/NamePerson";
	}
	@RequestMapping("/NamePerson/{id}")
	public String delete(@PathVariable String id){
		NPS.delete(id);
		return "redirect:/NamePerson";
	}
}
