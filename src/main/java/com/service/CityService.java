package com.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.entity.City;
import com.repository.CityRepository;


@Service
public class CityService {
	@Autowired
	CityRepository CityR;
	public Iterable<City> getAll(){
		return CityR.findAll();
	}
	public void saveCity(City city){
		CityR.save(city);
	}
	public City findOne(int id){
		
		return CityR.findOne(id);
		
	}
}
