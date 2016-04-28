package com.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.entity.Person;
import com.entity.Role;
import com.repository.PersonRepository;

@Service
public class PersonService {
@Autowired
	private PersonRepository PR;
@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;


	public void savePerson(Person person) {
		person.setPassword(bCryptPasswordEncoder.encode(person.getPassword()));
		person.setRole(Role.USER);
		PR.save( person);
		
	}
	
	public void ChengeInformation(Person person){
		PR.save(person);
	}
	
	public void saveAboutMe(String AboutMe,int ID){
		Person person =PR.findOneById(ID);
		person.setAboutMe(AboutMe);
		PR.save(person);
	}
	
	@Transactional
	public String saveFile(MultipartFile file,String id){
		String fileExpansion = getExpansion(file.getOriginalFilename());
		File pathToFolder = new File(System.getProperty("catalina.home")+"/files/img/avas/");
		creatFolder(pathToFolder);
		File pathToFile= new File(pathToFolder+"/"+id+fileExpansion);
		writeFile(pathToFile,file);
		Person person=PR.findOne((Integer.parseInt(id)));
		person.setAvaPhoto(getExpansion(fileExpansion));
		PR.save(person);
		return fileExpansion;
	}
	
	
	
	public void creatFolder(File pathToFolder ){
		if(!pathToFolder.exists())
			pathToFolder.mkdirs();
		
	}
	
	public String getExpansion(String fileName){
		return fileName.substring(fileName.lastIndexOf('.'));
	}
	
	
	public void writeFile(File PathToFile, MultipartFile file){
		try(OutputStream fos = new FileOutputStream(PathToFile);BufferedOutputStream bos = new BufferedOutputStream(fos)){
			bos.write(file.getBytes(), 0, file.getBytes().length);
			bos.flush();
		}catch(IOException e){
			
		}
	}
	
	

}