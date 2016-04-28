package com.entity;

import java.util.List;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class BMounth {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String mounth;
	
	private int mounthInt;
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="mounth")
	private List<Person> persons;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMounth() {
		return mounth;
	}
	public void setMounth(String mounth) {
		this.mounth = mounth;
	}
	public List<Person> getPersons() {
		return persons;
	}
	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}
	public int getMounthInt() {
		return mounthInt;
	}
	public void setMounthInt(int mounthInt) {
		this.mounthInt = mounthInt;
	}
	
	
}
