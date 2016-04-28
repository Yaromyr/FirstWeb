package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.BYear;
import com.repository.BYearRepository;

@Service
public class BYearService {
	@Autowired
	private BYearRepository BYR;
	
	public Iterable<BYear> getAll(){
		return BYR.findAll();
	}
	public BYear saveCountry(BYear bYear)
	{
		return BYR.save(bYear);
	}
	public BYear findOne(int id)
	{
		return BYR.findOne(id);	
	}
	

}
