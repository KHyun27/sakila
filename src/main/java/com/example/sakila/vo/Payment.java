package com.example.sakila.vo;

import lombok.Data;

@Data
public class Payment {
	
	private int paymentId; // PK
	private int customerId; // FK → customer.customer_id
	private int staffId; // FK → staff.staff_id
	private int rentalId; // FK → rental.rental_id
	private double amount;
	private String paymentDate;
	private String lastUpdate;

}
