<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.panelReg{

width:700px;
heught:300px;
border-left:1px solid darkblue;
border-right:1px solid darkblue;
margin:auto;
padding:30px;
}
.panelRun{
float:right;
/*background:silver;*/
width:150px;
height:300px;
border-left:1px solid darkblue;
border-right:1px solid darkblue;
margine:auto;
padding:30px;
}
a.knopka {
  color: #fff; /* цвет текста */
  text-decoration: none; /* убирать подчёркивание у ссылок */
  user-select: none; /* убирать выделение текста */
  background: darkblue; /* фон кнопки */
  padding: .7em 1.5em; /* отступ от текста */
  outline: none; /* убирать контур в Mozilla */
  margin:5px;
  width:80px;
} 
a.knopka:hover { background: blue; } /* при наведении курсора мышки */
a.knopka:active { background: rgb(152,15,0); } /* при нажатии */

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
	<body>
		<div class="panelRun">
			<table>
				<tr><a style="float:left;"href="PersonReg" class="knopka">Enter</a></tr>
				<tr><a style="float:left;"href="PersonReg" class="knopka">Registration</a></tr>
			</table>
		</div>
	<div class="panelReg">
		<form method="post" action ="?${_csrf.parameterName}=${_csrf.token}">
		 <table>
		  <tr>
			<th> Login:</th>
			<td><input name="login" type="text" ></td>
		  </tr>
		  <tr>
			<th> Password:</th>
			<td><input name="password" type="password" ></td>
		  </tr>
		  <tr>
			<th> Your Name:</th>
			<td><input name="name" type="text"></td>
		  </tr>
		  <tr>
			<th> Your Surname:</th>
			<td><input name="surName" type="text"></td>
		  </tr>
		  <tr>
			<th> Your Birthday:</th>
			<td><input name="BD" type="text"></td>
		  </tr>
		  <tr>
			<th> Your BirthdayMounth:</th>
			<td><input name="BMounth" type="text"></td>
		  </tr>
		  <tr>
			<th> Your BirthdayYear:</th>
			<td><input name="year" type="text"></td>
		  </tr>
		  <tr>
			<th>Your Country</th> 
			<td><select name="country">
					<c:forEach var="country" items="${countries}">
						<option value="${country.id}">
							${country.nameCountry}
						</option>
					</c:forEach>
			</select></td>
		  </tr>
			<tr>
			<th>Your City</th>
			<td><select name="city">
					<c:forEach var="city" items="${cities}">
						<option value="${city.id}">
							${city.nameCity}
						</option>
					</c:forEach>
			</select></td>
			</tr>
			<tr>
			<th>Select your sex</th>
			<td><select name="sex">
					<c:forEach var="sex" items="${sexs}">
						<option value="${sex}">
							${sex}
						</option>
					</c:forEach>
			</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="REGISTER"></td>
			</tr>
		</table>
		</form>
	</div>
	</body>
</html>