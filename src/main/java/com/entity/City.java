package com.entity;

import java.util.List;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
@Entity
public class City {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String nameCity;
	@ManyToOne
	private Country Country;
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="city")
	List<Person> persons;
	
	
	public List<Person> getPersons() {
		return persons;
	}
	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}
	public Country getCountry() {
		return Country;
	}
	public void setCountry(Country country) {
		Country = country;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNameCity() {
		return nameCity;
	}
	public void setNameCity(String city) {
		nameCity = city;
	}

	
	
	

}
