package com.demo.woolThreads.service;

import com.demo.woolThreads.models.Farmer;
import com.demo.woolThreads.models.input.CreateFarmerRequest;
import com.demo.woolThreads.models.output.CreateFarmerResponse;

import java.util.List;

public interface FarmerService {
    CreateFarmerResponse registerFarmer(CreateFarmerRequest farmerRequest);

    List<Farmer> getAllFarmers();
}
