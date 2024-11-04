package com.example.sakila.vo;

import lombok.Data;

@Data
public class Store {
	
	private int storeId; // PK
	private int managerStaffId; // FK → staff.staff_id
	private int addressId; // FK → address.address_id
	private String lastUpdate;

}
