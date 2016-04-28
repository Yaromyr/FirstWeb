package com.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.repository.PersonRepository;
import com.service.ApplicationToFriendsService;


@Controller
public class ApplicationsToFriendsController {

	@Autowired
	private ApplicationToFriendsService ATFS;
	@Autowired
	private PersonRepository PR;
	@Autowired
	private ApplicationToFriendsService ApplicationToFriendsService;
	
	@RequestMapping(value="/ApplicationToFriends")
	public String showApplication(Model model,Principal principal){
		if(principal!=null){
			com.entity.Person user=PR.findOneById(Integer.parseInt(principal.getName()));
			model.addAttribute("user", user);
			model.addAttribute("Applications", ApplicationToFriendsService.getAll(Integer.parseInt(principal.getName())));
			return "ApplicationToFriends";
		}else{
			return "redirect:/profile";
		}
	}
	@RequestMapping(value = "/aplication/friend", method = RequestMethod.POST)
	public String sendConfirmation(@RequestParam int reciver,Principal principal){
		ATFS.askApplication(reciver,(Integer.parseInt(principal.getName())) );
		return "redirect:/profile/"+reciver;
	}
	@RequestMapping(value = "/delete/application", method = RequestMethod.POST)
	public String deleteApplicattion(Principal principal,@RequestParam int reciver){
		ATFS.deletApplication(reciver, (Integer.parseInt(principal.getName())));
		return "redirect:/profile/"+reciver;
	}
	@RequestMapping(value = "/answertrue/friend", method = RequestMethod.POST)
	public String answertrueConfirmationFriend(Principal principal,@RequestParam int sender){
		 boolean confirmation=true;
		ATFS.answerApplication((Integer.parseInt(principal.getName())), sender, confirmation);
		return "redirect:/profile";
	}
	@RequestMapping(value = "/answerfalse/friend", method = RequestMethod.POST)
	public String answerfalseConfirmationFriend( Principal principal,@RequestParam int sender){
		boolean confirmation=false;
		ATFS.answerApplication((Integer.parseInt(principal.getName())), sender, confirmation);
		return "redirect:/profile";
	}
	

	
	
}
