package com.demo.woolThreads.models.output;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreateFarmerResponse {
    private String farmerId;
    private String name;
    private String address;
    private String phone;
    private String email;
    private String state;
    private String city;
    private String country;
    private String zipCode;
}
