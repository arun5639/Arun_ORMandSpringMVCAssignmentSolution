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
}

table {
	border-collapse: collapse;
	border: 0.25px solid;
	width: 100%;
}

th {
	border-collapse: collapse;
	background-color: Limegreen;
	padding: 7px;
	text-align: center;
	font-size: 17px;
	color: White;
}

tr {
	border-collapse: collapse;
	border: 0.25px black;
}

tr:nth-child(even) {
	border: 0.25px black;
	background-color: lightgray;
}

td {
	text-align: center;
}

input {
	border-radius: 5px;
	background-color: lightgray;
	border: 1px;
	font-weight: bold;
	width: 12%;
	height: 5%;
	font-size: 12px;
}
</style>
</head>

<body>
	<div class="myDivhead" id="">
		<h1>
			<b>CUSTOMER RELATIONSHIP MANAGEMENT </b>
		</h1>
	</div>
	<br> <br> <br>
	<div>
		<form action="/CustRelationshipMgmt/customer/addForm" method="post">
			<input type="submit" name="s" value="Add Customer" />
		</form>
	</div>

	<div>
		<%
			List<Customer> custList = (List<Customer>) request.getAttribute("allcustomer");
		%>

		<table>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<%
			for (Customer customer : custList) {
				out.println("<tr><td>" + customer.getFirstName() + "</td><td>" + customer.getLastName() + "</td><td>"
				+ customer.getEmail() + "</td><td><a href='/CustRelationshipMgmt/customer/showFormUpdate?custId="
				+ customer.getCustId() + "'>Update</a> | " + 
				"<a href='/CustRelationshipMgmt/customer/delete?custId="+ customer.getCustId()
				+ "' onclick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td></tr>");
			}
			%>
		</table>
	</div>
</body>
</html>