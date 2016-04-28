package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.BMounth;
import com.repository.BMounthRepository;

@Service
public class BMounthService {
	@Autowired
	private BMounthRepository BMR;
	
	public Iterable<BMounth> getAll(){
		return BMR.findAll();
	}
	public BMounth saveCountry(BMounth bMounth)
	{
		return BMR.save(bMounth);
	}
	public BMounth findOne(int id)
	{
		return BMR.findOne(id);	
	}
	
	
}
