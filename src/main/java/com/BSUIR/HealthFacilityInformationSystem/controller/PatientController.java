package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Doctor;
import com.BSUIR.HealthFacilityInformationSystem.domain.Role;
import com.BSUIR.HealthFacilityInformationSystem.domain.Schedule;
import com.BSUIR.HealthFacilityInformationSystem.domain.Ticket;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.DoctorRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.ScheduleRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/patient")
@PreAuthorize("hasAnyAuthority('ADMIN','DOCTOR')")
public class PatientController {

    private final DoctorRepository doctorRepository;
    private final ScheduleRepository scheduleRepository;
    private final TicketRepository ticketRepository;

    @Autowired
    public PatientController(final DoctorRepository doctorRepository, final ScheduleRepository scheduleRepository, final TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
        this.doctorRepository = doctorRepository;
        this.scheduleRepository = scheduleRepository;
    }

    @GetMapping
    public String patient(@AuthenticationPrincipal User user, Model model) {
        Doctor doctor =  doctorRepository.findByUser_Id(user.getId());
        if(user.getRoles().contains(Role.ADMIN)){
            List<Schedule> schedules = scheduleRepository.findAll();
            List<Ticket> expiredTickets = ticketRepository.findByResultIsNotNull();
            List<Ticket> tickets = ticketRepository.findByResultIsNull();
            Collections.reverse(tickets);
            Collections.reverse(expiredTickets);
            Collections.reverse(schedules);
            model.addAttribute("tickets", tickets);
            model.addAttribute("expiredTickets", expiredTickets);
            model.addAttribute("schedules",schedules);
        } else if(user.getRoles().contains(Role.DOCTOR)){
            List<Schedule> schedules = scheduleRepository.findByDoctor_Id(doctor.getId());
            List<Ticket> tickets = ticketRepository.findByDoctor_IdAndResultIsNull(doctor.getId());
            List<Ticket> expiredTickets = ticketRepository.findByDoctor_IdAndResultIsNotNull(doctor.getId());
            Collections.reverse(tickets);
            Collections.reverse(expiredTickets);
            Collections.reverse(schedules);
            model.addAttribute("tickets", tickets);
            model.addAttribute("expiredTickets", expiredTickets);
            model.addAttribute("schedules",schedules);
        }
        model.addAttribute("user", user);

        return "patient";
    }

    @PostMapping
    public void patientSave(
            @RequestParam Map<String, String> form,
            Model model) {

    }

}
