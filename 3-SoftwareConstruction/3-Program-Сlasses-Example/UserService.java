package com.lab9.temperaturechecker.service;

import com.lab9.temperaturechecker.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserService extends JpaRepository<User, Integer> {
}
