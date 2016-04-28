package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.entity.BDay;
import com.repository.BDayRepository;

@Service
public class BDayService {
	@Autowired
	private BDayRepository BDR;
	
	public Iterable<BDay> getAll(){
		return BDR.findAll();
	}
	public BDay saveCountry(BDay bDay)
	{
		return BDR.save(bDay);
	}
	public BDay findOne(int id)
	{
		return BDR.findOne(id);	
	}

}
