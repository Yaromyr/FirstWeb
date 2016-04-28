package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ApplicationToFriends {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private boolean confirmation;
	
	@ManyToOne
	private Person reciver;
	@ManyToOne
	private Person sender;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isConfirmation() {
		return confirmation;
	}
	public void setConfirmation(boolean confirmation) {
		this.confirmation = confirmation;
	}
	
	public Person getReciver() {
		return reciver;
	}
	public void setReciver(Person reciver) {
		this.reciver = reciver;
	}
	public Person getSender() {
		return sender;
	}
	public void setSender(Person sender) {
		 this.sender =sender;
	}
	

}
