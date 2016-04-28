package com.entity;

import java.util.List;



import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

//import org.springframework.data.jpa.domain.Specification;
//import org.springframework.data.jpa.domain.Specifications;


@Entity
public class Person{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column
//	@Size(min=6, max=16, message="Your login must be 6>=login<=16")
	private String login;
	@Column
	private String password;
	@Column
	private String AboutMe;
	@Column
	private String avaPhoto;	
	public String getAvaPhoto() {
		return avaPhoto;
	}
	public void setAvaPhoto(String avaPhoto) {
		this.avaPhoto = avaPhoto;
	}
	@Column
	private String surName;
	@Column
	private int age;
	@Column
//	@Email(message="Your email is not true")
	private String email;
	@Enumerated()
	private Sex Sex;
	@Enumerated()
	private Role Role;
	@ManyToOne(cascade={CascadeType.ALL})
	private NamePerson name;
	@ManyToOne(cascade={CascadeType.MERGE})
	private BMounth mounth;
	@ManyToOne(cascade={CascadeType.MERGE})
	private BYear year;
	@ManyToOne(cascade={CascadeType.MERGE})
	private BDay day;
	@ManyToOne
	private Country country;
	@ManyToOne
	private City city;
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="Person")
	private List<Photos> Photos;
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="Person")
	private List<Videos> Videos;
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE},fetch=FetchType.LAZY,mappedBy="Reciver")
	private List<Message> messageRecive;
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE},fetch=FetchType.LAZY,mappedBy="Sender")
	private List<Message> messageSend;
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE},fetch=FetchType.LAZY,mappedBy="reciver")
	private List<ApplicationToFriends> friendRecive;
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE},fetch=FetchType.LAZY,mappedBy="sender")
	private List<ApplicationToFriends> friendSend;
	@ManyToMany
	@JoinTable(name="Person_Friends")
	private List<Person> friends;
	@ManyToMany
	@JoinTable(name="Person_Followers")
	private List<Person> followers;
	
//	private Specifications<Person> sp =null;
//	
//	
//	private void setSpec(Specification<Person> sp){
//		if(this.sp==null){
//			this.sp = Specifications.where(sp);
//		}else{
//			this.sp.and(sp);
//		}
//	}
			
	
	public List<ApplicationToFriends> getFriendRecive() {
		return friendRecive;
	}
	public void setFriendRecive(List<ApplicationToFriends> friendRecive) {
		this.friendRecive = friendRecive;
	}
	public List<ApplicationToFriends> getFriendSend() {
		return friendSend;
	}
	public void setFriendSend(List<ApplicationToFriends> friendSend) {
		this.friendSend = friendSend;
	}
	public List<Person> getFollowers() {
		return followers;
	}
	public void setFollowers(List<Person> followers) {
		this.followers = followers;
	}
	public List<Person> getFriends() {
		return friends;
	}
	public void setFriends(List<Person> friends) {
		this.friends = friends;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public NamePerson getName() {
		return name;
	}
	public void setName(NamePerson name) {
		
		this.name = name;
	}
	public String getSurName() {
		return surName;
	}
	public void setSurName(String surName) {
		this.surName = surName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Sex getSex() {
		return Sex;
	}
	public void setSex(Sex sex) {
		Sex = sex;
	}
	public BMounth getMounth() {
		return mounth;
	}
	public void setMounth(BMounth mounth) {
		this.mounth = mounth;
	}
	public Country getCountry() {
		return country;
	}
	public void setCountry(Country country) {
		this.country = country;
	}
	public String getAboutMe() {
		return AboutMe;
	}
	public void setAboutMe(String aboutMe) {
		AboutMe = aboutMe;
	}

	public List<Message> getMessageRecive() {
		return messageRecive;
	}
	public void setMessageRecive(List<Message> messageRecive) {
		this.messageRecive = messageRecive;
	}
	public List<Message> getMessageSend() {
		return messageSend;
	}
	public void setMessageSend(List<Message> messageSend) {
		this.messageSend = messageSend;
	}
	public List<Photos> getPhotos() {
		return Photos;
	}
	public void setPhotos(List<Photos> photos) {
		Photos = photos;
	}
	public List<Videos> getVideos() {
		return Videos;
	}
	public void setVideos(List<Videos> videos) {
		Videos = videos;
	}
	public BDay getDay() {
		return day;
	}
	public void setDay(BDay day) {
		this.day = day;
	}
	public void setYear(BYear year) {
		this.year = year;
	}
	public BYear getYear() {
		return year;
	}
	public Role getRole() {
		return Role;
	}
	public void setRole(Role role) {
		Role = role;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Person [id=" + id + ", login=" + login + ", password=" + password + ", AboutMe=" + AboutMe
				+ ", AvaPhoto=" + avaPhoto + ", year=" + year + ", surName=" + surName + ", age=" + age + ", Sex=" + Sex ;
	}	
}
