package com.service;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;
import com.entity.Country;
import com.repository.CountryRepository;

@Service
public class CountryService {
	@Autowired
	CountryRepository CR;
	
	
	public  Iterable<Country> getAll(){
		return CR.findAll();
	}
	public Country saveCountry(Country country)
	{
		return CR.save(country);
	}
	public Country findOne(int id)
	{
		return CR.findOne(id);	
	}
	
	
}
