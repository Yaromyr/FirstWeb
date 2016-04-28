package com.service;


import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Message;
import com.entity.Person;
import com.repository.MessageRepository;
import com.repository.PersonRepository;

@Service
public class MessageService {
	
	@Autowired
	private PersonRepository PR;
	@Autowired
	private MessageRepository MR;
	
	@Transactional
	public void sendMessage(int reciverID,int senderID,String message){
		Message message1=new Message();
		Person reciver =PR.findOne(reciverID);
		Person sender =PR.findOne(senderID);
		Date date=new Date();
		message1.setReciver(reciver);
		message1.setSender(sender);
		message1.setMessage(message);
		message1.setDate(date);
		List<Message> messageRecive=reciver.getMessageRecive();
		Hibernate.initialize(messageRecive);
		List<Message> messageSend=sender.getMessageSend();
		Hibernate.initialize(messageSend);
		messageRecive.add(message1);
		messageSend.add(message1);
		MR.save(message1);
		PR.save(reciver);
		PR.save(sender);
		System.out.println(date.getTime());
	}
	
//	public List<Message> bufferList(Person person){
//		
//		
//	}
	
}
