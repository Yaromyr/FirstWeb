package com.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.entity.NamePerson;
import com.repository.NamePersonRepository;

@Service
public class NamePersonService {
	@Autowired
	private NamePersonRepository NPR;
	
	public void save(String name){
		if(NPR.findOneByName(name)==null){
			NamePerson NamePerson=new NamePerson();
			NamePerson.setName(name);
			NPR.save(NamePerson);
		}

	}
	public NamePerson findOneByName(String name){
		return NPR.findOneByName(name);
	}
	public  Iterable<NamePerson> getAll(){
		return NPR.findAll();
	}
	public void delete(String id){
		NPR.delete(Integer.parseInt(id));
	}
	
	
	
	
}
