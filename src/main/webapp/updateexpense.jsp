<%@page import="com.expensetracker.entity.Expense"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Update Expense</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f1f4f8;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }

      .expense-form-container {
        background-color: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 400px;
      }

      h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
      }

      label {
        display: block;
        margin-top: 15px;
        margin-bottom: 5px;
        color: #444;
      }

      input[type="text"],
      input[type="number"],
      textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
      }

      textarea {
        resize: vertical;
      }

      input[type="submit"] {
        width: 100%;
        margin-top: 25px;
        padding: 12px;
        border: none;
        background-color: #ffc107;
        color: #212529;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
      }

      input[type="submit"]:hover {
        background-color: #e0a800;
      }

      .message {
        margin-top: 20px;
        color: green;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div class="expense-form-container">
      <h2>Update Expense</h2>
      <form action="/updateexpense" method="post">
      
      	<label for="expenseId">Expense Id:</label>
        <input type="text" id="expenseId" name="eid" readonly="readonly" value="${exp.eid}" required />
      
        <label for="expenseName">Expense Name:</label>
        <input type="text" id="expenseName" name="name" value="${exp.name}" required />
        
        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" value="${exp.amount}" required />

        <label for="desciption">Description:</label>
        <input
          id="description"
          type="text"
          name="desciption"
          value = "${exp.desciption}"
          required
        ></input>

        <input type="submit" value="Update Expense" />
      </form>

      <div class="message" id="message"></div>
    </div>
  </body>
</html>
