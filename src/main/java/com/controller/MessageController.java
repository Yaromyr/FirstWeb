package com.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.hibernate.Hibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Message;
import com.entity.Person;
import com.repository.PersonRepository;
import com.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService MS;
	
	@Autowired
	private PersonRepository PR;
	@RequestMapping(value="/write/message", method = RequestMethod.POST)
	public String writeMessage(Principal principal,@RequestParam int reciverID, @RequestParam String message){
		
		MS.sendMessage(reciverID, (Integer.parseInt(principal.getName())), message);
		return "redirect:/profile";
	}
	
	@RequestMapping(value="/message")
	@Transactional
	public String showMyMessage(Principal principal, Model model){
		if(principal!=null){
			Person person=PR.findOne((Integer.parseInt(principal.getName())));
			
			
			List<Message> allMessage = new ArrayList<Message>();
			Hibernate.initialize(allMessage);
			
			Hibernate.initialize(person.getMessageSend());
			Hibernate.initialize(person.getMessageRecive());
			allMessage.addAll(person.getMessageRecive());
			allMessage.addAll(person.getMessageSend());
			Collections.sort(allMessage,new Comparator<Message>() {
				@Override
				public int compare(Message m1, Message m2) {
					
					if(m1.getDate().getTime() > m2.getDate().getTime()){
						return 1;
					}else if(m1.getDate().getTime() < m2.getDate().getTime()){
						return -1;
					}
					return 0;
				}
			}); 
			
			model.addAttribute("user", person);
			model.addAttribute("messages", allMessage);
			return "message";
	}else{
		return "redirect:/login";
	}
		
}

}
