package com.repository;

import org.springframework.data.repository.CrudRepository;

import com.entity.Country;

public interface CountryRepository extends CrudRepository<Country, Integer> {
	
}
