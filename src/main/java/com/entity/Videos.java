package com.entity;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Videos {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String Videos;
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
	
	public String getVideos() {
		return Videos;
	}
	public void setVideos(String videos) {
		Videos = videos;
	}

	

	
}
