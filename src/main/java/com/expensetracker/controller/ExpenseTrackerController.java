package com.expensetracker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.expensetracker.constants.AppConstants;
import com.expensetracker.entity.Expense;
import com.expensetracker.entity.User;
import com.expensetracker.service.ExpenseTrackerService;
import com.expensetracker.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ExpenseTrackerController {

	@Autowired
	private ExpenseTrackerService expenseService;

	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String loginPage() {
		return AppConstants.LOGIN_PAGE;
	}

	@GetMapping("/welcome")
	public String welcomePage() {
		return AppConstants.WELCOME_PAGE;
	}

	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("user", new User());
		return "register.jsp";
	}

	@GetMapping("/addexpense")
	public String addExpensePage(Model model) {
		model.addAttribute("expense", new Expense());
		return "addexpense.jsp";
	}

	@GetMapping("/updateExpense")
	public String updateExpensePage(@RequestParam Integer eid, Model model) {
		Expense expense = expenseService.findById(eid);
		model.addAttribute("exp", expense);
		return "updateexpense.jsp";
	}

	@PostMapping("/register")
	public String registerUser(User user, Model model) {
		boolean saved = userService.save(user);
		if (saved) {
			model.addAttribute("succmsg", "Registered Successfully");
		} else {
			model.addAttribute("errmsg", "UserName : " + user.getUserName() + " is Already Registered");
		}
		return AppConstants.LOGIN_PAGE;
	}

	@PostMapping("/login")
	public String loginUser(HttpServletRequest request, Model model) {
		String un = request.getParameter(AppConstants.USERNAME);
		String pwd = request.getParameter("password");

		boolean login = userService.login(un, pwd);
		if (login) {
			// create a session to maintain logged in user information
			HttpSession session = request.getSession(true);// will create an object if it is not present else it will
															// create new session object and return it
			session.setAttribute(AppConstants.USERNAME, un);
			return AppConstants.WELCOME_PAGE;
		} else {
			model.addAttribute("errmsg", "Invalid credentials");
			return AppConstants.LOGIN_PAGE;
		}
	}

	@PostMapping("/addexpense")
	public String saveExpense(Expense expense, Model model, HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		String userName = (String) session.getAttribute(AppConstants.USERNAME);

		User user = userService.findByUserName(userName);

		expense.setUser(user);

		Integer eid = expenseService.saveExpense(expense);

		model.addAttribute("msg", "expense added succesfully with id : " + eid);

		return AppConstants.WELCOME_PAGE;
	}

	@GetMapping("/expenselist")
	public String getExpenseByUser(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String userName = (String) session.getAttribute(AppConstants.USERNAME);

		User user = userService.findByUserName(userName);

		model.addAttribute("exps", user.getExpenses());

		return "expenselist.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.invalidate();// destroys the session
		return AppConstants.LOGIN_PAGE;
	}

	@PostMapping("/updateexpense")
	public String updateExpense(Expense expense, Model model) {
		String message = expenseService.updateExpense(expense);
		model.addAttribute("msg", message);
		return AppConstants.WELCOME_PAGE;
	}

	@GetMapping("/deleteExpense")
	public String getMethodName(@RequestParam Integer eid, Model model) {
		String message = expenseService.deleteExpense(eid);
		model.addAttribute("msg", message);
		return AppConstants.WELCOME_PAGE;
	}

}
