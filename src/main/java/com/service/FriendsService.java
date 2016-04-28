package com.service;





import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Person;
import com.repository.PersonRepository;

@Service
public class FriendsService {
	@Autowired
	private PersonRepository PR;
	public void addFriend(int id){
		Person person=new Person();
		Person personFriend =PR.findOne(id);
		person.getFriends().add(personFriend);
	}
	@Transactional
	public void deleteFriend(int me,int myFriend){
		Person person1=PR.findOneFriendById(me, myFriend);
		Person person2=PR.findOne(me);
		List<Person>friends1=person2.getFriends();
		friends1.remove(person1);
		List<Person>friends2=person1.getFriends();
		friends2.remove(person2);
		
	}
	
	
//	public boolean findFriendById(int idSender,int idReciver,boolean is){
//		Person person=PR.findOne(idSender);
//		Person personReciver=PR.findOne(idReciver);
//		List<Person>friend=person.getFriends();
//		Hibernate.initialize(friend);
//		if(friend.contains(personReciver)){
//			is=true;
//		}
//		return is;
//	}
	
}
