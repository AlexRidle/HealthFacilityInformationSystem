package com.BSUIR.HealthFacilityInformationSystem.repository;

import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
