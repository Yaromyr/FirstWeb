package com.service.Editors;

import java.beans.PropertyEditorSupport;

import com.service.CityService;

public class CityEditor extends PropertyEditorSupport {
	
	private final CityService CS;

	public CityEditor(CityService CS){
		this.CS = CS;
	}
	
	@Override
	public void setAsText(String text){
		setValue(CS.findOne(Integer.valueOf(text)));
	}

}
