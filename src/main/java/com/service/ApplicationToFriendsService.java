package com.service;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.ApplicationToFriends;
import com.entity.Person;
import com.repository.ApplicationToFriendsRepository;
import com.repository.PersonRepository;

@Service
public class ApplicationToFriendsService {
	@Autowired
	private ApplicationToFriendsRepository ATFR;
	@Autowired
	private PersonRepository PR;
	
	
	@Transactional
	public void askApplication(int reciverID,int senderID){
		Person reciver =PR.findOne(reciverID);
		Person sender =PR.findOne(senderID);
		ApplicationToFriends ATF1=ATFR.findApplicationByPersons( reciverID, senderID );
		if(ATF1!=null){
			List<Person>followersRecivers=sender.getFollowers();
			Hibernate.initialize(followersRecivers);
			followersRecivers.remove(PR.findOneFollowerById(senderID, reciverID));
			List<Person>friendsSenders=sender.getFriends();
			Hibernate.initialize(friendsSenders);
			List<Person>friendsRecivers=reciver.getFriends();
			Hibernate.initialize(friendsRecivers);
			friendsRecivers.add(sender);
			friendsSenders.add(reciver);
			PR.save(reciver);
			PR.save(sender);
			ATFR.delete(ATF1);
		}else{
		ApplicationToFriends ATF = new ApplicationToFriends();
		ATF.setSender(sender);
		ATF.setReciver(reciver);
		List<Person>followersRecivers=reciver.getFollowers();
		Hibernate.initialize(followersRecivers);
		followersRecivers.add(sender);
		PR.save(reciver);
		ATFR.save(ATF);
		}
	}
	
	@Transactional
	public void answerApplication(int reciverID,int senderID,boolean confirmation){
		ApplicationToFriends ATF=ATFR.findOneByReciverId(reciverID);
		ATF.setConfirmation(confirmation);
		Person sender =PR.findOne(senderID);
		Person reciver =PR.findOne(reciverID);
		
		if(!confirmation){
			Hibernate.initialize(reciver.getFollowers());
			reciver.getFollowers().add(sender);	
		}else{
			List<Person>followersRecivers=reciver.getFollowers();
			Hibernate.initialize(followersRecivers);
			followersRecivers.remove(PR.findOneFollowerById(reciverID, senderID));
			Hibernate.initialize(reciver.getFriends());
			reciver.getFriends().add(sender);
			Hibernate.initialize(sender.getFriends());
			sender.getFriends().add(reciver);
			PR.save(reciver);
			PR.save(sender);
			ATF.setReciver(null);
			ATF.setSender(null);
			ATFR.save(ATF);
			ATFR.delete(ATF);
		}
	}
	
	public List<ApplicationToFriends> getAll(int id) {
		List<ApplicationToFriends> applicationToFriendss= ATFR.findByReciverId(id);
		for (ApplicationToFriends applicationToFriends : applicationToFriendss) 
		{
			Hibernate.initialize(applicationToFriends);
		}
		return applicationToFriendss; 
		}
	@Transactional
	public void deletApplication(int reciverID,int senderID){//Можна знайти заявку на jsp за допомогою input type hidden
		
		
		ApplicationToFriends ATF1=ATFR.findApplicationByPersons(senderID , reciverID );
		
		if(ATF1!=null){
		ATFR.delete(ATF1);
		Person person =PR.findOneFollowerById(senderID,reciverID);
		Person person1=PR.findOne(reciverID);
		List <Person>followers=person1.getFollowers();
		followers.remove(person);
		}
	}

}
