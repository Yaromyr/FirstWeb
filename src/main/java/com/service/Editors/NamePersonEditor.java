package com.service.Editors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;

import com.entity.NamePerson;
import com.service.NamePersonService;

public class NamePersonEditor extends PropertyEditorSupport {
	@Autowired
	private final NamePersonService NPS;
	
	public NamePersonEditor(NamePersonService NPS){
		this.NPS = NPS;
	}
	
	@Override
	public void setAsText(String text){
		
		NamePerson nameperson=NPS.findOneByName(text);
		if(nameperson!=null){
			setValue(nameperson);
		}else{
			nameperson=new NamePerson();
			nameperson.setName(text);
			setValue(nameperson);
		}
	}
}
