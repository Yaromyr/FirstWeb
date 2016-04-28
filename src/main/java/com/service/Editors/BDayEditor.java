package com.service.Editors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;

import com.service.BDayService;

public class BDayEditor extends PropertyEditorSupport{
	@Autowired
	private final BDayService BDS;
	
	public BDayEditor(BDayService BDS){
		this.BDS = BDS;
	}
	@Override
	public void setAsText(String text){
		setValue(BDS.findOne(Integer.valueOf(text)));
	}
	
}
