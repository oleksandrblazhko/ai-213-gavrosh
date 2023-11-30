package com.lab9.temperturechecker.service;

import com.lab9.temperturechecker.entity.EFreshAir;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public interface TemperatureService extends JpaRepository<Temperature, Integer> {
}
