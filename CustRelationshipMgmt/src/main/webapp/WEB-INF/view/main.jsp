<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List, com.Learning.Cust.Entity.Customer"%>
<html>
<head>
<style>
.myDivhead {
	border: 1px black;
	background-color: Limegreen;
	padding: 20px;
	text-align: center;
	font-size: 12px;
	align:center;
}

input {
	border-radius: 5px;
	background-color: lightgray;
	border: 1px;
	font-weight: bold;
	width: 10%;
	height: 5%;
	font-size: 12px;
}
</style>
</head>

<body>
	<div class="myDivhead" id="">
		<h1><b>CUSTOMER RELATIONSHIP MANAGEMENT</b></h1><br><br><br>
	
		<form action="/CustRelationshipMgmt/customer/list" method="post">
			<input type="submit" name="s" value="Enter" />
		</form>
	</div>
</body>
</html>