package com.expensetracker.service;

import com.expensetracker.entity.Expense;

public interface ExpenseTrackerService {

	Integer saveExpense(Expense expense);

	Expense findById(Integer eid);

	String updateExpense(Expense expense);

	String deleteExpense(Integer eid);

}
