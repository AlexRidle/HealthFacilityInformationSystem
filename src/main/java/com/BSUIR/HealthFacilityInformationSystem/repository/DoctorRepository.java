package com.BSUIR.HealthFacilityInformationSystem.repository;

import com.BSUIR.HealthFacilityInformationSystem.domain.Department;
import com.BSUIR.HealthFacilityInformationSystem.domain.Doctor;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DoctorRepository extends JpaRepository<Doctor, Long> {
    List<Doctor> findAll();
    List<Doctor> findAllByActive(final boolean active);
    List<Doctor> findAllByActiveAndDepartment(final boolean active, final Department department);
    List<Doctor> findByDepartment(final Department department);
    Doctor findByUser_Id(final Long user_id);

    boolean existsByUser_Id(final Long user_id);
}
