package com.entity;

import java.util.Date;


import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Message {
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	private Person Reciver;
	
	@ManyToOne
	private Person Sender;
	
	private Date date;
	
	private String Message;
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Person getReciver() {
		return Reciver;
	}

	public void setReciver(Person reciver) {
		Reciver = reciver;
	}

	public Person getSender() {
		return Sender;
	}

	public void setSender(Person sender) {
		Sender = sender;
	}

	public String getMessage() {
		return Message;
	}

	public void setMessage(String massage) {
		Message = massage;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", Reciver=" + Reciver + ", Sender=" + Sender + ", Message=" + Message + "]";
	}
}
