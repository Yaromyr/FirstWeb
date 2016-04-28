<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<a href="NamePerson">Name</a>
	<a href="PersonReg">Реєстрація</a>
	<a href="login">login</a>
	<form method="post" action ="?${_csrf.parameterName}=${_csrf.token}">
	<table>
		<tr>
			<th>Age:</th>
			<td><input name="age" type="text"/></td>
			
		</tr>
		<tr>
			<th>Name:</th>
			<td><input name="name" type="text"/></td>
		</tr>
		<tr>
			<th></th>
			<td><input type="submit" value="add"/></td>
		</tr>
	</table>
	</form>
	<div style="margin-top:100px;"><h2>Hello ${user}</h2></div>
	<table>
	<c:if test="${persons.size() ne 0}">
		<c:forEach begin="0" end="${persons.size()-1}" var="index">
			<tr>
				<td>${persons.get(index).getAge()}</td>
				<td>${persons.get(index).name}</td>
				<td><a href="${url}${index}">delete</a></td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${persons.size() eq 0}">
			<p>Nothing</p>
		</c:if>
	</table>
</body>
</html>