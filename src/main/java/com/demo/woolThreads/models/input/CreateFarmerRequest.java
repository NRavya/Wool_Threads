package com.demo.woolThreads.models.input;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreateFarmerRequest {
    private String name;
    private String address;
    private String phone;
    private String email;
    private String password;
    private String state;
    private String city;
    private String country;
    private String zipCode;
}
