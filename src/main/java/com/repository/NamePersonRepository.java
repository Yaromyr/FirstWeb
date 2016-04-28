package com.repository;

import org.springframework.data.repository.CrudRepository;

import com.entity.NamePerson;


public interface NamePersonRepository extends CrudRepository<NamePerson, Integer> {
	NamePerson findOneByName(String name);
}
