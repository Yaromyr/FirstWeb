package com.service.Editors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;

import com.service.BMounthService;

public class BMounthEditor extends PropertyEditorSupport{
	@Autowired
	private final BMounthService BMS;
	
	public BMounthEditor(BMounthService BMS){
		this.BMS = BMS;
	}
	@Override
	public void setAsText(String text){
		setValue(BMS.findOne(Integer.valueOf(text)));
	}

}
