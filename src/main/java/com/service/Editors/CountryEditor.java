package com.service.Editors;

import java.beans.PropertyEditorSupport;

import com.service.CountryService;

public class CountryEditor extends PropertyEditorSupport{
	
	private final CountryService CS;
	
	public CountryEditor(CountryService CS){
		this.CS = CS;
	}
	@Override
	public void setAsText(String text){
		setValue(CS.findOne(Integer.valueOf(text)));
	}
}
