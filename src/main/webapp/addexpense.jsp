<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Add Expense</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }
      
      .nav-links {
        display: flex;
        justify-content:center;
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

      .expense-form-container {
        background-color: white;
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
        color: #555;
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
        background-color: #28a745;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
      }

      input[type="submit"]:hover {
        background-color: #218838;
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
      <h2>Add Expense</h2>
      <form action="addexpense" method="post">
        <label for="expenseName">Expense Name:</label>
        <input type="text" id="expenseName" name="name" required />

        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" required />

        <label for="description">Description:</label>
        <textarea
          id="description"
          name="desciption"
          rows="4"
          required
        ></textarea>

        <input type="submit" value="Add Expense" />
      </form>

      <div class="message" id="message"></div>
       <div class="nav-links">
    	<a  href="welcome">Go Back</a>
       </div>
    </div>
  </body>
</html>
