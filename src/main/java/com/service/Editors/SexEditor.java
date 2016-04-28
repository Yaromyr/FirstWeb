package com.service.Editors;

import java.beans.PropertyEditorSupport;

import com.entity.Sex;

public class SexEditor extends PropertyEditorSupport{
	
	
	@SuppressWarnings("unused")
	private final Sex sex;
	
	public SexEditor(Sex sex){
		this.sex=sex;
	}
	@Override
	public void setAsText(String text){
		setValue(Sex.valueOf(text));
	}

}
