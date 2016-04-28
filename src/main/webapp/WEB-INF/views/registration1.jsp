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
			    height:700px;
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
			.panel{
			margin-top:50%;
			}
			.row{
			margin-bottom:3px;
			}
			.q1{
			margin-left:25px;
			}
			.w1{
			margin-top:5px;
			}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Reg</title>
	</head>
	<body>
		<script type="text/javascript" src="http://www.clubdesign.at/floatlabels.js"></script>
<div class="main">
<div class="container-fluid">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title" style="text-align:center;">Persons.com <small>by Yaromyr</small></h3>
			 			</div>
			 			<div class="panel-body">
			    		<sf:form method="post" modelAttribute="user" role="form ">
			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    			<sf:errors style="color:red;" path="login"/>
			                <sf:input type="text" path="login" id="login" class="form-control input-sm floatlabel" placeholder="Login"/>
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<sf:input type="password" path="password" id="password" class="form-control input-sm" placeholder="Password"/>
			    					</div>
			    				</div>
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">
			    						<sf:input type="text" path="surName" id="surName" class="form-control input-sm" placeholder="Your Last Name"/>
			    					</div>
			    				</div>
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">
			    						<sf:input type="text" path="name" value="${user.name.name}" id="name" class="form-control input-sm" placeholder="Your Name"/>
			    					</div>
			    				</div>
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">
			    						<div  class="w1">
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
										</sf:select></div>
			    					</div>
			    				</div>
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-4 col-sm-4 col-md-4">
					    			<div class="form-group">
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
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			    						<sf:errors style="color:red;" path="email"/> 
			    						<sf:input type="text" path="email" id="email" class="form-control input-sm" placeholder="Your email"/>
			    					</div>
			    				</div>
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="q1">
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
									</sf:select></div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="q1">
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
			    			<input type="submit" value="REGISTER" class="btn btn-info btn-block">
			    		</sf:form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    </div>
    <script>
    $(function() {
    	  $('input').floatlabel({labelEndTop:0});
    });</script>
	</body>
</html>