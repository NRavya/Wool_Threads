package com.demo.woolThreads.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Document(collection = "Farmers") // MongoDB collection name
public class Farmer {
    @Id
    private String farmerId;
    private String name;
    private String address;
    private String phone;
    private String email;
    @JsonIgnore
    private String password;
    private String state;
    private String city;
    private String country;
    private String zipCode;
}
