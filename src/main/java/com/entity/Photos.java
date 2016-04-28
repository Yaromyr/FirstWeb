package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Photos {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String Photos;
	@ManyToOne
	private Person Person;

	public Person getPerson() {
		return Person;
	}
	public void setPerson(Person person) {
		Person = person;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getPhotos() {
		return Photos;
	}
	public void setPhotos(String photos) {
		Photos = photos;
	}

	
}
