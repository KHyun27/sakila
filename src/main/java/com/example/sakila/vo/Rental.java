package com.example.sakila.vo;

import lombok.Data;

@Data
public class Rental {
	
	private int rentalId; // PK
	private String rentalDate; 
	private int inventoryId; // FK → inventory.inventory_id
	private int customerId; // FK → customer.customer_id
	private String returnDate;
	private int staffId; // FK → staff.staff_id
	private String lastUpdate;

}
