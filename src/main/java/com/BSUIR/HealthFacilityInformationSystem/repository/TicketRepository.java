package com.BSUIR.HealthFacilityInformationSystem.repository;

import com.BSUIR.HealthFacilityInformationSystem.domain.Ticket;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TicketRepository extends JpaRepository<Ticket, Long> {
    List<Ticket> findByUser_Id(final Long user_id);
    List<Ticket> findByDoctor_Id(final Long doctor_id);
}
