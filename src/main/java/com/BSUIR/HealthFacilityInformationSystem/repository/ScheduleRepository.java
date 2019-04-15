package com.BSUIR.HealthFacilityInformationSystem.repository;

import com.BSUIR.HealthFacilityInformationSystem.domain.Doctor;
import com.BSUIR.HealthFacilityInformationSystem.domain.Schedule;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface ScheduleRepository extends JpaRepository<Schedule, Long> {
    List<Schedule> findByDoctor_Id(final Long doctor_id);
    boolean existsByDoctorAndScheduleDateAndRegistered(final Doctor doctor, final LocalDateTime scheduleDate, final boolean registered);
    List<Schedule> findByRegistered(final boolean registered);
}
