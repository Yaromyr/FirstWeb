<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
	<head>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />
		
		<style type="text/css">
			.demoPadder {
    			padding-top:15px;
    					}
    				.btn-default {
					  color: #007aff;
					  background-color: #fff;
					  border-color: #007aff;
					} 

					.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open > .btn-default.dropdown-toggle {
					  color: #fff;
					  background-color: #007aff;
					  border-color: #007aff;
					    }
			.main{
			  /* Safari 4-5, Chrome 1-9 */
			    background: -webkit-gradient(radial, center center, 0, center center, 460, from(#1a82f7), to(#2F2727));
			
			  /* Safari 5.1+, Chrome 10+ */
			    background: -webkit-radial-gradient(circle, #1a82f7, #2F2727);
			
			  /* Firefox 3.6+ */
			    background: -moz-radial-gradient(circle, #1a82f7, #2F2727);
			
			  /* IE 10 */
			    background: -ms-radial-gradient(circle, #1a82f7, #2F2727);
			    width:100%;
			    
			}
			.panel{
			width:70%;
			height:800px;
			}
			.mainPanel{
			margin:auto;
			}
			.panel-default{
			margin:auto;
			}
			.centered-form{
				margin-top: 60px;
			}
			
			.centered-form .panel{
				background: rgba(255, 255, 255, 0.8);
				box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
			}
			label.label-floatlabel {
			    font-weight: bold;
			    color: #46b8da;
			    font-size: 11px;
			}
			img{
				height: auto;
				max-width: 100%;
				width: auto;
				border-radius: 10%;
			}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Profile</title>
	</head>
	<body>
	  <security:authorize
 				access="isAuthenticated() and !hasRole('ADMIN')">	        
		<div class="main">
			<div class="container">
        		<div class="row centered-form">
					<div class="mainPanel">
						<div class="panel panel-default">
			        			<div class="panel-heading">
			        				<h3 class="panel-title" style="text-align:left; float:left;"> ${user.getName().getName()} ${user.getSurName()} <small>online</small></h3>
						    		<h2 class="panel-title" style="text-align:right; color:#00547E; font-family: Terminal Dosis; ">Persons.com <small>By Yaromyr</small></h2>
								</div>
							<div class="panel-body">
								
								<div class="col-xs-8 col-sm-8 col-md-8" style=" height:400px;">
									<table>
										<tr>
											<th style="color:;">Chek In:</th>
											<td><a style="margin-left:15px;" href="#">Lviv</a></td>
										</tr>
										<tr>
											<th style="color:;"> Birthday:</th>
											<td><a style="margin-left:15px;" href="#">${user.getDay().getDay()}.${user.getMounth().getMounth()}.${user.getYear().getYear()}</a></td>
										</tr>
										<tr>
											<th style="color:;">Country and city:</th>
											<td><a style="margin-left:15px;" href="#">${user.getCountry().getNameCountry()}</a>,<a href="#">${user.getCity().getNameCity()}</a></td>
										</tr>
										<tr>
											<th style="color:;"> Sex:</th>
											<td><a style="margin-left:15px;" href="#">${user.getSex()}</a></td>
										</tr>
										<tr>
											<th>Other about me:</th>
											<td>
												 <div style="margin-left:15px;">
														<security:authorize
	        											access="isAuthenticated() and principal.username=='${user.id}'">
															<c:if test="${user.getAboutMe() == null}">
																<form method="post" action ="?${_csrf.parameterName}=${_csrf.token}">
																	<input name="AboutMe" type="text"/>
																	<input value="Save" type="submit"/>
																</form>	
															</c:if>	
														</security:authorize>
														<c:if test="${user.getAboutMe() != null}">
															<a>${user.getAboutMe()}</a> 
														</c:if>
												</div> 
											</td>
										</tr>
									</table>
								</div>
								<div id="hidden_content" style=" display: none; width:250px; height:250px; position:absolute; z-index:1; margin:auto;" class="panel panel-default" >
							        <div class="panel-heading">
							        	<h3 class="panel-title" style="text-align:left; float:left;"> ${user.getName().getName()} ${user.getSurName()} <small>online</small></h3>
							    		<h2 class="panel-title" style="text-align:right; color:#00547E; font-family: Terminal Dosis; ">Persons.com <small>By Yaromyr</small></h2>
									</div>
									<div class="panel-body">
										<sf:form method="post" action="/write/message">
											<input name="reciverID" type="hidden" value="${user.id}">
											<input name="message" type="text">
											<input type="submit" value="Send message"/>
										</sf:form>
									</div>
								</div>
								<script>
									function toggle(el) {
									el.style.display = (el.style.display == 'none') ? '' : 'none'
									}
								</script>
								<div class="col-xs-4 col-sm-4 col-md-4" style=" max-height:350px; min-width:260px; border:1px solid black; padding:0px; border-radius: 10%;">
									<c:if test="${user.avaPhoto!= null}">
										<img style="max-height:350px; min-width:260px;" src="/files/img/avas/${user.id}${user.avaPhoto}"/>
									</c:if>
									
									
									<c:if test="${user.avaPhoto == null}">
										<img style="max-height:350px; min-width:260px;" src="http://best-dem.ru/wp-content/uploads/2013/12/drthdrth.png"/>
									</c:if>
								
								</div>	
									<security:authorize
	       								 access="isAuthenticated() and principal.username=='${user.id}'">
										<c:url value="/upload/ava" var="ava"/>
										<sf:form  action="${ava}?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="POST">
											<input name="AvaPhoto" type="file"/>
											<input type="submit" value="OK">
										</sf:form> 
									</security:authorize>
								
								 <security:authorize
	       								 access="isAuthenticated() and principal.username!='${user.id}'">
	       								 <c:if test="${isApp}">
	       								 		<sf:form method="post" action ="/delete/application">
													<input name="reciver" type="hidden" value="${user.id}">
													<input value="Delete request" type="submit"/>
												</sf:form>
	       								 </c:if>
	       								 <c:if test="${!isApp}">
											<c:if test="${!isFriend}">
												<sf:form method="post" action ="/aplication/friend">
													<input name="reciver" type="hidden" value="${user.id}">
													<input value="Add in Friends" type="submit"/>
												</sf:form>
											</c:if>
											<c:if test="${isFriend}">
												${user.getName().getName()} is your friend.
												<sf:form method="post" action ="/delete/friend">
													<input name="reciver" type="hidden" value="${user.id}">
													<input value="Delete friend" type="submit"/>
												</sf:form>
											</c:if>
										</c:if>
										<a onclick="toggle(hidden_content)">Write Message</a>
									</security:authorize>
								<div class="btn-group btn-group-justified demoPadder" role="group" aria-label="Justified button group">
      								<a href="/ApplicationToFriends" class="btn btn-default" role="button">Application to friends</a>
      								<a href="/friends" class="btn btn-default" role="button">Friends</a>
      								<a href="/message" class="btn btn-default" role="button">Message</a>
      								<a href="#" class="btn btn-default" role="button">Middle</a>
      								<a href="#" class="btn btn-default" role="button">Right</a>
    							</div>
							</div>
						</div>
					</div>					
				</div>
			</div>	
		</div>
		 </security:authorize>
	</body>
</html>
 	<%-- <body>
	    <security:authorize
	        access="isAuthenticated() and hasRole('ROLE_ADMIN')">
	        	Це буде бачити тільки адмін
	    </security:authorize>
	    <security:authorize access="!isAuthenticated()">
	        	Це буде бачити користувач який не залогінився
	    </security:authorize>
	    <security:authorize
	        access="isAuthenticated() and principal.username!='${user.id}' and !hasRole('ROLE_ADMIN')">
	        	Це буде бачити користувач який залогінився він не являється власником сторінки і він не адмін
	    </security:authorize>
	    <security:authorize
	        access="isAuthenticated() and principal.username=='${user.id}'">
	        	Це буде бачити користувач який є власником сторінки
	        </security:authorize>
	        <security:authorize access="hasRole('USER')">
	        	Це буде бачити тільки користувач з роллю "користувач"
	        </security:authorize>
	</body> --%>
