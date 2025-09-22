package com.expensetracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.expensetracker.entity.Expense;

public interface ExpenseTrackerRepository extends JpaRepository<Expense, Integer>{

}
