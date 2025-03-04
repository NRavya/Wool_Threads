package com.demo.woolThreads.rest;

import com.demo.woolThreads.models.Farmer;
import com.demo.woolThreads.models.input.CreateFarmerRequest;
import com.demo.woolThreads.models.output.CreateFarmerResponse;
import com.demo.woolThreads.service.FarmerService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/farmers")
@RequiredArgsConstructor
public class FarmerController {

    private final FarmerService farmerService;

    @PostMapping("/register")
    public CreateFarmerResponse registerFarmer(@RequestBody CreateFarmerRequest farmerRequest) {
        return farmerService.registerFarmer(farmerRequest);
    }

    @GetMapping("/all")
    public List<Farmer> getAllFarmers() {
        return farmerService.getAllFarmers();
    }
}

