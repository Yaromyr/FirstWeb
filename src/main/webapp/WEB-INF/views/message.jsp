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
			.messageText:hover{
			
			color: #005580;
			border-radius:15px;
			background:#cce6ff;
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
								 <table>
									<c:forEach items="${messages}" var="message" >
										<sf:form method="post" action="/write/message">
											<tr style="width:100%; margin:5px; border:1px solid white; ">
											<c:url value="${message.message}" var="message1"/>
												<td> New Message for:  <a href="/profile/${message.reciver.id}">${message.reciver.name.name}  ${message.reciver.surName}</a></td>
												<td> New Message from:  <a href="/profile/${message.sender.id}">${message.sender.name.name}  ${message.sender.surName}</a></td>
												<td style="width:80%; height:25px; padding-left:20px; " class="messageText" ><a onclick="toggle(hidden_content)">${message1}</a></td>
											</tr>
										</sf:form>
									</c:forEach>
								</table>
								<div id="hidden_content" style=" display:none; width:350px; height:250px; position:absolute; z-index:1; margin:auto;" class="panel panel-default" >
							        <div class="panel-heading">
							        	<h6 class="panel-title" style="text-align:left; float:left;">New message for ${message.reciver.name.name} ${message.reciver.surName} <small>online</small></h6>
							    		<h2 class="panel-title" style="text-align:right; color:#00547E; font-family: Terminal Dosis; "><small><a onclick="toggle(hidden_content)">Close</a></small></h2>
									</div>
									<div class="panel-body">
										<sf:form method="post" action="/write/message">
											
											${message1}
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
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	 </security:authorize>
	</body>
</html>
