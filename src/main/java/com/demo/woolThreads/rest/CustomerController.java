package com.demo.woolThreads.rest;

import com.demo.woolThreads.models.Customer;
import com.demo.woolThreads.models.input.CreateCustomerRequest;
import com.demo.woolThreads.models.output.CreateCustomerResponse;
import com.demo.woolThreads.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerService customerService;

    @PostMapping("/register")
    public CreateCustomerResponse registerCustomer(@RequestBody CreateCustomerRequest customerRequest) {
        return customerService.registerCustomer(customerRequest);
    }

    @GetMapping("/all")
    public List<Customer> getAllCustomers() {
        return customerService.getAllCustomers();
    }
}
