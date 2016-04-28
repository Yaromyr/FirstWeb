package com.service.Editors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import com.service.BYearService;

public class BYearEditor extends PropertyEditorSupport{
	@Autowired
	private final BYearService BYS;
	
	public BYearEditor(BYearService BYS){
		this.BYS = BYS;
	}
	@Override
	public void setAsText(String text){
		setValue(BYS.findOne(Integer.valueOf(text)));
	}
}
