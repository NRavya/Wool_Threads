package com.demo.woolThreads.service;

import com.demo.woolThreads.DBconnection.FarmerRepositoryService;
import com.demo.woolThreads.models.Farmer;
import com.demo.woolThreads.models.input.CreateFarmerRequest;
import com.demo.woolThreads.models.output.CreateFarmerResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class FarmerServiceImpl implements FarmerService {
    private final FarmerRepositoryService farmerRepositoryService;

    @Override
    public CreateFarmerResponse registerFarmer(CreateFarmerRequest farmerRequest) {
        Farmer farmer = farmerRepositoryService.saveFarmer(mapToFarmer(farmerRequest));
        return buildCreateFarmerResponse(farmer);
    }

    private CreateFarmerResponse buildCreateFarmerResponse(Farmer farmer) {
        return CreateFarmerResponse.builder()
                .farmerId(farmer.getFarmerId())
                .name(farmer.getName())
                .phone(farmer.getPhone())
                .state(farmer.getState())
                .country(farmer.getCountry())
                .zipCode(farmer.getZipCode())
                .address(farmer.getAddress())
                .email(farmer.getEmail())
                .city(farmer.getCity())
                .build();
    }

    @Override
    public List<Farmer> getAllFarmers() {
        return farmerRepositoryService.getAllFarmers();
    }

    private Farmer mapToFarmer(CreateFarmerRequest createFarmerRequest) {
        return Farmer.builder()
                .name(createFarmerRequest.getName())
                .email(createFarmerRequest.getEmail())
                .password(createFarmerRequest.getPassword())
                .state(createFarmerRequest.getState())
                .country(createFarmerRequest.getCountry())
                .zipCode(createFarmerRequest.getZipCode())
                .phone(createFarmerRequest.getPhone())
                .address(createFarmerRequest.getAddress())
                .city(createFarmerRequest.getCity())
                .build();
    }

}
