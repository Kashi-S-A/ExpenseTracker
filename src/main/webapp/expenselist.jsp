<%@page import="com.expensetracker.entity.Expense"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Expense List</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #eef1f5;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 40px;
}

h2 {
	color: #333;
	margin-bottom: 30px;
}

table {
	border-collapse: collapse;
	width: 80%;
	max-width: 1400px;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.nav-links {
	display: flex;
	gap: 20px;
}

.nav-links a {
	text-decoration: none;
	color: white;
	background-color: #007bff;
	padding: 12px 20px;
	border-radius: 5px;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

.nav-links a:hover {
	background-color: #0056b3;
}

th, td {
	padding: 12px 20px;
	text-align: left;
	border-bottom: 1px solid #ccc;
}

th {
	background-color: #007bff;
	color: white;
}

tr:hover {
	background-color: #f1f1f1;
}

.no-data {
	margin-top: 20px;
	color: #666;
}
</style>
</head>
<body>
	<h2>Expense List</h2>

	<table>
		<thead>
			<tr>
				<th>Expense Name</th>
				<th>Amount</th>
				<th>Description</th>
				<th>Exp added Date</th>
				<th>Last Updated On Date</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<!-- Sample static data -->

			<%
			List<Expense> expList = (List<Expense>) request.getAttribute("exps");

			for (Expense expense : expList) {
			%>

			<tr>
				<td><%=expense.getName()%></td>
				<td><%=expense.getAmount()%></td>
				<td><%=expense.getDesciption()%></td>
				<td><%=expense.getCreatedDate()%></td>
				<td><%=expense.getUpdatedDate()%></td>
				<td><a href="updateExpense?eid=<%= expense.getEid()%>">update</a></td>
				<td><a href="deleteExpense?eid=<%= expense.getEid()%>">Delete</a></td>
			</tr>

			<%
			}
			%>
		</tbody>
	</table>

	<br>

	<div class="nav-links">
		<a href="welcome">Go Back</a>
	</div>

</body>
</html>
