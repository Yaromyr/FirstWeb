package com.controller;

import java.security.Principal;


import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.repository.PersonRepository;
import com.service.FriendsService;

@Controller
public class FriendsController {
	@Autowired
	private PersonRepository PR;
	@Autowired
	private FriendsService FS;
	
	@Transactional
	@RequestMapping(value="/friends")
	public String ShowMyFriends(Model model,Principal principal){
		if(principal!=null){
			com.entity.Person user=PR.findOneById(Integer.parseInt(principal.getName()));
			model.addAttribute("user", user);
			Hibernate.initialize(user.getFriends());
			
			return "friends";
		}else{
			return "redirect:/login";
		}
	}
	@RequestMapping(value = "/delete/friend", method = RequestMethod.POST)
	public String deleteApplicattion(Principal principal,@RequestParam int reciver){
		FS.deleteFriend((Integer.parseInt(principal.getName())), reciver);
		return "redirect:/profile/"+reciver;
	}
}
