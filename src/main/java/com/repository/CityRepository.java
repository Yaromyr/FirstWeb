package com.repository;

import org.springframework.data.repository.CrudRepository;

import com.entity.City;

public interface CityRepository extends CrudRepository<City, Integer>{
	
}
