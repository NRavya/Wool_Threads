package com.demo.woolThreads.service;

import com.demo.woolThreads.models.Customer;
import com.demo.woolThreads.models.input.CreateCustomerRequest;
import com.demo.woolThreads.models.output.CreateCustomerResponse;

import java.util.List;

public interface CustomerService {
    CreateCustomerResponse registerCustomer(CreateCustomerRequest customerRequest);

    List<Customer> getAllCustomers();
}
