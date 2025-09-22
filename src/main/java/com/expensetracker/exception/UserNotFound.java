package com.expensetracker.exception;

public class UserNotFound extends RuntimeException {

	private final String message;

	public UserNotFound() {
		this.message = "";
	}

	public UserNotFound(String message) {
		this.message = message;
	}

	@Override
	public String getMessage() {
		return message;
	}

}
