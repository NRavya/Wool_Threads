package com.demo.woolThreads.service;

import com.demo.woolThreads.DBconnection.CustomerRepositoryService;
import com.demo.woolThreads.models.Customer;
import com.demo.woolThreads.models.input.CreateCustomerRequest;
import com.demo.woolThreads.models.output.CreateCustomerResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CustomerServiceImpl implements CustomerService {
    private final CustomerRepositoryService customerService;

    @Override
    public CreateCustomerResponse registerCustomer(CreateCustomerRequest customerRequest) {
        Customer customer = customerService.saveCustomer(mapToCustomer(customerRequest));
        return buildCreateCustomerResponse(customer);
    }

    private CreateCustomerResponse buildCreateCustomerResponse(Customer customer) {
        return CreateCustomerResponse.builder()
                .customerId(customer.getCustomerId())
                .name(customer.getName())
                .phone(customer.getPhone())
                .state(customer.getState())
                .country(customer.getCountry())
                .zipCode(customer.getZipCode())
                .address(customer.getAddress())
                .email(customer.getEmail())
                .city(customer.getCity())
                .build();
    }

    @Override
    public List<Customer> getAllCustomers() {
        return customerService.getAllCustomers();
    }

    private Customer mapToCustomer(CreateCustomerRequest customerRequest) {
        return Customer.builder()
                .name(customerRequest.getName())
                .email(customerRequest.getEmail())
                .password(customerRequest.getPassword())
                .state(customerRequest.getState())
                .country(customerRequest.getCountry())
                .zipCode(customerRequest.getZipCode())
                .phone(customerRequest.getPhone())
                .address(customerRequest.getAddress())
                .city(customerRequest.getCity())
                .build();
    }

}
