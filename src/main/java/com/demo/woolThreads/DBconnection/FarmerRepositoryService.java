package com.demo.woolThreads.DBconnection;

import com.demo.woolThreads.models.Farmer;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FarmerRepositoryService {
    private final FarmerRepository farmerRepository;

    public Farmer saveFarmer(Farmer farmer) {
        return farmerRepository.save(farmer);
    }

    public List<Farmer> getAllFarmers() {
        return farmerRepository.findAll();
    }

    public Farmer getFarmerById(String id) {
        return farmerRepository.findById(id).orElse(null);
    }
}

