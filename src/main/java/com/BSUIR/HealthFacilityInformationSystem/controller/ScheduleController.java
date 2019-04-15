package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Doctor;
import com.BSUIR.HealthFacilityInformationSystem.domain.Schedule;
import com.BSUIR.HealthFacilityInformationSystem.domain.Ticket;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.DoctorRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.ScheduleRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.TicketRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/schedule")
@PreAuthorize("hasAnyAuthority('ADMIN','OPERATOR')")
public class ScheduleController {

    private final DoctorRepository doctorRepository;
    private final ScheduleRepository scheduleRepository;
    private final TicketRepository ticketRepository;

    @Autowired
    public ScheduleController(final DoctorRepository doctorRepository, final ScheduleRepository scheduleRepository, final TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
        this.doctorRepository = doctorRepository;
        this.scheduleRepository = scheduleRepository;
    }

    @GetMapping
    public String schedule(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user", user);
        List<Doctor> doctors = doctorRepository.findAll();
        List<Schedule> unregSchedules = scheduleRepository.findByRegistered(false);
        List<Schedule> regSchedules = scheduleRepository.findByRegistered(true);
        model.addAttribute("unregSchedules", unregSchedules);
        model.addAttribute("regSchedules", regSchedules);
        model.addAttribute("doctors", doctors);
        return "schedule";
    }

    @PostMapping
    public void scheduleSave(
            @RequestParam Map<String, String> form,
            Model model) {
        String response = "success";
        String[] dates = form.get("scheduleDates").split(", ");
        Schedule schedule;
        for (String date: dates) {
            Doctor doctor = doctorRepository.findById(Long.valueOf(form.get("scheduleDoctors"))).get();
            LocalDateTime scheduleDate = LocalDateTime.parse(date + " " + form.get("scheduleTime"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")).plusHours(3);
            schedule = new Schedule(doctor,scheduleDate,false);
            if(scheduleRepository.existsByDoctorAndScheduleDateAndRegistered(doctor,scheduleDate,false)){
                response = "with errors";
            } else {
                scheduleRepository.save(schedule);
            }
        }
        List<Doctor> doctors = doctorRepository.findAll();
        model.addAttribute("response", response);
        model.addAttribute("doctors", doctors);
    }

    @GetMapping("{doctor}")
    public String doctorScheduleList(@PathVariable Doctor doctor, Model model) {
        List<Schedule> schedules = scheduleRepository.findByDoctor_Id(doctor.getId());
        List<Ticket> tickets = ticketRepository.findByDoctor_IdAndResultIsNull(doctor.getId());
        List<Ticket> expiredTickets = ticketRepository.findByDoctor_IdAndResultIsNotNull(doctor.getId());
        Collections.reverse(tickets);
        model.addAttribute("tickets", tickets);
        model.addAttribute("expiredTickets", expiredTickets);
        model.addAttribute("schedules",schedules);
        model.addAttribute("doctor", doctor);
        return "doctorScheduleList";
    }

//    @GetMapping("{schedule}")
//    public String scheduleEdit(@PathVariable Schedule schedule, Model model) {
//
//
//        return "scheduleEdit";
//    }

}
