package com.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.repository.ApplicationToFriendsRepository;
import com.repository.PersonRepository;
import com.service.PersonService;


@Controller
public class profileController {
	@Autowired
	private PersonRepository PR;
	@Autowired
	private ApplicationToFriendsRepository ATFR;
	@RequestMapping(value="/profile")
	public String showProfile(Principal principal){
		if(principal!=null){
			return "redirect:/profile/" + principal.getName();
		}else{
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/profile/{ID}")
	public String showProfileName(Model model,@PathVariable int ID,Principal principal){
		com.entity.Person owner=PR.findOneById(ID);
		com.entity.Person princ=PR.findOneById((Integer.parseInt(principal.getName())));
		if(princ == null || owner==null){
			return "redirect:/login";
		}else{
			model.addAttribute("isFriend",PR.findOneFriendById((Integer.parseInt(principal.getName())), ID) != null);
			model.addAttribute("user",owner);
			model.addAttribute("isApp", ATFR.findApplicationByPersons((Integer.parseInt(principal.getName())), ID) != null);
			return "profile";
		}
		
	}

	
	@Autowired
	private PersonService PS;
	
	@RequestMapping(value = "/profile/{ID}", method = RequestMethod.POST)
	public String saveInf(@RequestParam String AboutMe,@PathVariable int ID){
		PS.saveAboutMe(AboutMe,ID);
		return "redirect:/profile";
	}
	@RequestMapping(value = "/logout")
	public String logout(){
		SecurityContextHolder.getContext().setAuthentication(null);
		return "redirect:/login";
	}


	@RequestMapping(value = "/upload/ava", method = RequestMethod.POST)
	public String saveImg(@RequestParam MultipartFile AvaPhoto,Principal principal){
		PS.saveFile(AvaPhoto,principal.getName());
		return "redirect:/profile";
	}
	@RequestMapping(value="/files/img/avas/{path}.jpg")
	public void allLogoImageJpg(@PathVariable String path, HttpServletResponse response) throws IOException{
		InputStream is = new FileInputStream(new File(System.getProperty("catalina.home")+"/files/img/avas/" + path + ".jpg"));
		BufferedInputStream inputStream = new BufferedInputStream(is);
		int nRead;
		byte[] b = new byte[10000];
		ByteArrayOutputStream arrayOutputStream=new ByteArrayOutputStream();
		while((nRead= inputStream.read(b,0,b.length)) != -1){
			arrayOutputStream.write(b,0,nRead);
		}
		arrayOutputStream.flush();
		byte[] bn =arrayOutputStream.toByteArray();
		response.setContentType("image/jpg");
		response.setContentLength(bn.length);
		OutputStream os = response.getOutputStream();
		os.write(bn);
		os.flush();
		os.close();
		inputStream.close();
	}
	@RequestMapping(value="/files/img/avas/{path}.png")
	public void allLogoImagePng(@PathVariable String path, HttpServletResponse response) throws IOException{
		InputStream is = new FileInputStream(new File(System.getProperty("catalina.home")+"/files/img/avas/" + path + ".png"));
		BufferedInputStream inputStream = new BufferedInputStream(is);
		int nRead;
		byte[] b = new byte[10000];
		ByteArrayOutputStream arrayOutputStream=new ByteArrayOutputStream();
		while((nRead= inputStream.read(b,0,b.length)) != -1){
			arrayOutputStream.write(b,0,nRead);
		}
		arrayOutputStream.flush();
		byte[] bn =arrayOutputStream.toByteArray();
		response.setContentType("image/png");
		response.setContentLength(bn.length);
		OutputStream os = response.getOutputStream();
		os.write(bn);
		os.flush();
		os.close();
		inputStream.close();
	}
	@RequestMapping(value="/files/img/avas/{path}.jpeg")
	public void allLogoImageJpeg(@PathVariable String path, HttpServletResponse response) throws IOException{
		InputStream is = new FileInputStream(new File(System.getProperty("catalina.home")+"/files/img/avas/" + path + ".jpeg"));
		BufferedInputStream inputStream = new BufferedInputStream(is);
		int nRead;
		byte[] b = new byte[10000];
		ByteArrayOutputStream arrayOutputStream=new ByteArrayOutputStream();
		while((nRead= inputStream.read(b,0,b.length)) != -1){
			arrayOutputStream.write(b,0,nRead);
		}
		arrayOutputStream.flush();
		byte[] bn =arrayOutputStream.toByteArray();
		response.setContentType("image/jpeg");
		response.setContentLength(bn.length);
		OutputStream os = response.getOutputStream();
		os.write(bn);
		os.flush();
		os.close();
		inputStream.close();
	}
	
}
