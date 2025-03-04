package com.demo.woolThreads.DBconnection;

import com.demo.woolThreads.models.Customer;
import com.demo.woolThreads.models.Farmer;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface FarmerRepository extends MongoRepository<Farmer, String> {
}
