<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE HTML>
<html>
<head>
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>

	 <%-- <c:url value="/login" var="loginUrl"></c:url>
		<form method="post"  action ="${loginUrl}?${_csrf.parameterName}=${_csrf.token}">
		  <table>
			  <tr>
				<th> Login:</th>
				<td><input name="username" type="text" ></td>
			  </tr>
			  <tr>
				<th> Password:</th>
				<td><input name="password" type="password" ></td>
			  </tr>
		  	<tr>
		  		<td><input type="submit" value="Sign In"></td>
		  	</tr>
		  </table>
		 </form> --%>
<script type="text/javascript" src="http://www.clubdesign.at/floatlabels.js"></script>
<div class="main">
<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title" style="text-align:center;">Persons.com <small>by Yaromyr</small></h3>
			 			</div>
			 			<div class="panel-body">
			 			<c:url value="/login" var="loginUrl"/>
			    		<form method="post" role="form" action ="${loginUrl}?${_csrf.parameterName}=${_csrf.token}">
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
					    			<div class="form-group">
					    				<input type="text" name="username" id="username" class="form-control input-sm" placeholder="Enter Login"/>
					    			</div>
					    		</div>
			    				
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
					    			<div class="form-group">
					    				<input type="password" name="password" id="password" class="form-control input-sm" placeholder="Enter password"/>
					    			</div>
					    		</div>
				    		</div>
			    			
			    			<input type="submit" value="Enter" class="btn btn-info btn-block">
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    </div>
    <script type="text/javascript"> 
    	document.getElementById('username').focus();
	</script>
    <script>
    $(function() {
    	  $('input').floatlabel({labelEndTop:0});
    });</script>
		 
</body>
</html>

