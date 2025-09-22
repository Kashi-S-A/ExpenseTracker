package com.expensetracker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.expensetracker.entity.Expense;
import com.expensetracker.repository.ExpenseTrackerRepository;

@Service
public class ExpenseTrackerServiceImpl implements ExpenseTrackerService {

	@Autowired
	private ExpenseTrackerRepository expenseRepository;

	@Override
	public Integer saveExpense(Expense expense) {
		return expenseRepository.save(expense).getEid();
	}

	@Override
	public Expense findById(Integer eid) {
		return expenseRepository.findById(eid).orElseThrow(()->new RuntimeException("Not found"));
	}

	@Override
	public String updateExpense(Expense expense) {
		
		Expense exp = findById(expense.getEid());
		exp.setName(expense.getName());
		exp.setDesciption(expense.getDesciption());
		exp.setAmount(expense.getAmount());
		
		expenseRepository.save(exp);
		
		return "Updated Successfully";
	}

	@Override
	public String deleteExpense(Integer eid) {
		expenseRepository.deleteById(eid);
		return "Deleted Successfully";
	}

}
