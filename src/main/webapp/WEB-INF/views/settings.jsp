<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
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
 				access="isAuthenticated() and principal.username =='${user.id}' and !hasRole('ADMIN')">	        
		<div class="main">
			<div class="container">
        		<div class="row centered-form">
					<div class="mainPanel">
						<div class="panel panel-default">
			        			<div class="panel-heading">
			        				<h3 class="panel-title" style="text-align:left; float:left;"> ${user.name.name} ${user.surName} <small>online</small></h3>
						    		<h2 class="panel-title" style="text-align:right; color:#00547E; font-family: Terminal Dosis; ">Persons.com <small>By Yaromyr</small></h2>
								</div>
							<div class="panel-body">
						
						<sf:form method="post" modelAttribute="user" role="form " >
			    			<sf:input path="id" type="hidden"/>
			    			<div class="row">
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">
			    						<p>Change your name:</p>
			    						<sf:input type="text" path="name" id="name" class="form-control input-sm"  value="${user.name.name}"/>
			    					</div>
			    				</div>
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">
			    						<p>Change your surname:</p>
			    						<sf:input type="text" path="surName" id="surName" class="form-control input-sm" value="${user.surName}"/>
			    					</div>
			    				</div>
			    				
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-4 col-sm-4 col-md-4">
					    			<div class="form-group">
					    				<p>Change your Birthday:</p>
						    			<sf:select path="day" >
											<c:forEach var="day" items="${BDays}">
												<c:if test="${user.day.id ne day.id}">
													<sf:option value="${day.id}">
														${day.day}
													</sf:option>
												</c:if>
												<c:if test="${user.day.id eq day.id}">
													<sf:option selected="selected" value="${day.id}">
														${day.day}
													</sf:option>
												</c:if>
											</c:forEach>
										</sf:select> 
					    			</div>
					    		</div>
					    		<div class="col-xs-4 col-sm-4 col-md-4">
					    			<div class="form-group">
					    				<p>Change your month of birth:</p>
					    				<sf:select path="mounth">
											<c:forEach var="mounth" items="${BMounths}">
												<c:if test="${user.mounth.id ne mounth.id}">
													<sf:option value="${mounth.id}">
														${mounth.mounth}
													</sf:option>
												</c:if>
												<c:if test="${user.mounth.id eq mounth.id}">
													<sf:option selected="selected" value="${mounth.id}">
														${mounth.mounth}
													</sf:option>
												</c:if>
											</c:forEach>
										</sf:select>
					    			</div>
					    		</div>
					    		<div class="col-xs-4 col-sm-4 col-md-4">
					    			<div class="form-group">
					    				<p>Change your year of birth:</p>
					    				<sf:select path="year">
											<c:forEach var="year" items="${BYears}">
												<c:if test="${user.year.id ne year.id}">
													<sf:option value="${year.id}">
														${year.year}
													</sf:option>
												</c:if>
												<c:if test="${user.year.id eq year.id}">
													<sf:option selected="selected" value="${year.id}">
														${year.year}
													</sf:option>
												</c:if>
											</c:forEach>
										</sf:select>
					    			</div>
					    		</div>
				    		</div>
				    		<div class="row">
					    		<div class="col-xs-4 col-sm-4 col-md-4">
				    				<div class="form-group">
				    					<div  class="w1">
				    					<p>Change your sex:</p>
				    						<sf:select path="Sex">
											<c:forEach var="sex" items="${sexs}">
												<c:if test="${user.sex ne sex}">
													<sf:option value="${sex}">
														${sex}
													</sf:option>
												</c:if >
												<c:if test="${user.sex eq sex}">
													<sf:option selected="selected" value="${sex}">
														${sex}
													</sf:option>
												</c:if>
											</c:forEach>
										</sf:select>
										</div>
			    					</div>
				    			</div>
				    		</div>
			    			<div class="row">
			    				<div class="col-xs-3 col-sm-3 col-md-3">
			    					<div class="q1">
			    						<p>Change your country:</p>
					    					<sf:select path="country">
												<c:forEach var="country" items="${countries}">
													<c:if test="${user.country.id ne country.id}">
														<sf:option value="${country.id}">
															${country.nameCountry}
														</sf:option>
													</c:if>
													<c:if test="${user.country.id eq country.id}">
														<sf:option selected="selected" value="${country.id}">
															${country.nameCountry}
														</sf:option>
													</c:if>
												</c:forEach>
											</sf:select>
									</div>
			    				</div>
			    				<div class="col-xs-3 col-sm-3 col-md-3">
			    					<div class="q1">
			    						<p>Change your city:</p>
					    					<sf:select path="city">
												<c:forEach var="city" items="${cities}">
													<c:if test="${user.city.id ne city.id}">
														<sf:option value="${city.id}">
															${city.nameCity}
														</sf:option>
													</c:if>
													<c:if test="${user.city.id eq city.id}">
														<sf:option selected="selected" value="${city.id}">
															${city.nameCity}
														</sf:option>
													</c:if>
												</c:forEach>
											</sf:select>
										</div>
			    				</div>
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-4 col-sm-4 col-md-4">
				    				<p>Change information about you:</p>
						    		<sf:input type="text" path="AboutMe" id="AboutMe" class="form-control input-sm" value="${user.getAboutMe()}"/>
						    	</div>
			    			</div>
			    			<div class="row">
				    			<div class="col-xs-3 col-sm-3 col-md-3" style="float:right;">
				    				<input type="submit" value="Change information" class="btn btn-info btn-block">
				    			</div>
			    			</div>
			    		</sf:form>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	 </security:authorize>
	</body>
</html>
 
