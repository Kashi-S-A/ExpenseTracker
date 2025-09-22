<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Expense Tracker</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f6fc;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
      }

      h1 {
        color: #333;
        margin-bottom: 40px;
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
    </style>
  </head>
  <body>
    <h1>Welcome to Expense Tracker</h1>
	<h4 style="color: green">${msg}</h4>
    <div class="nav-links">
      <a href="addexpense">Add Expense</a>
      <a href="expenselist">Expense List</a>
      <a style="background-color : red" href="logout">Logout</a>
    </div>
    <p>
      Manage expenses effectively using above links, you can add new expense ,
      update it and see history of added expenses
    </p>
  </body>
</html>
