<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List, com.Learning.Cust.Entity.Customer"%>
<html>
<head>
<style type="text/css">
label{
	width:100px;
	display:inline-block;
	text-align:right;
	margin-right: 50px;
}

input{
	margin-bottom:3px;
	border-radius:5px;
	border:1px solid;
}

.myError{
	font-weight: bold;
	font-size: 12px;
	color: red;
	margin-left: 153px; 
	border-style: hidden;
}

.myButton{
	background-color: lightgrey;
	border-radius:5px; 
	border:1px solid; 
	margin-left: 153px; 
	font-weight:bold; 
	width:8%; 
	height:5%;
}

.myDiv {
	border: 1px black;
	background-color: Limegreen;
	padding: 10px;
	text-align: center;
	font-size: 12px;
}
</style>
<body>
	<div class="mydiv">
		<h1 style="color:white">
			<b>CUSTOMER RELATIONSHIP MANAGEMENT </b>
		</h1>
	</div>

	<br>
	<div>
		<%
			Customer cust = (Customer) request.getAttribute("customer");
			String rError = (String) request.getAttribute("Err");
		%>
		<h2 style="text-align: left; color: black; font-size:1.25em">Save Customer</h2>
			<input type="text" class="myError" value="${Err}" />
			<form action="/CustRelationshipMgmt/customer/save" method="post">
				<label for="firstName">First Name:</label> 
				<input type="text" name="firstName" value="${customer.firstName}" size="30" style="height:20px"/><br>
				<label for="lastName">Last Name:</label>
				<input type="text" name="lastName" value="${customer.lastName}" size="30" style="height:20px"/><br>
				<label for="email">Email:</label>
				<input type="text" name="email" value="${customer.email}" size="30" style="height:20px"/><br><br>
				<input class="myButton" type="submit" name="submit" value="Save"/>		
				<br>
			<a href='/CustRelationshipMgmt/customer/list' style="font-size:15px;">Back to List</a>	
			</form>
	</div>	
</body>
</html>