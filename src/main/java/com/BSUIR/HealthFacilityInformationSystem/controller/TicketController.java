package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Department;
import com.BSUIR.HealthFacilityInformationSystem.domain.Role;
import com.BSUIR.HealthFacilityInformationSystem.domain.Ticket;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.DoctorRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.ScheduleRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Map;

@Controller
@RequestMapping("/ticket")
public class TicketController {
    private final TicketRepository ticketRepository;
    private final DoctorRepository doctorRepository;
    private final ScheduleRepository scheduleRepository;

    @Autowired
    public TicketController(final TicketRepository ticketRepository, final DoctorRepository doctorRepository, final ScheduleRepository scheduleRepository) {
        this.ticketRepository = ticketRepository;
        this.doctorRepository = doctorRepository;
        this.scheduleRepository = scheduleRepository;
    }

    @GetMapping
    public String ticket(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("departments", Department.values());
        return "ticket";
    }

    @GetMapping("/edit/{ticket}")
    public String editTicket(
            @AuthenticationPrincipal User user,
            @PathVariable Ticket ticket,
            @RequestParam Map<String, String> form,
            Model model) {

        if(user.getRoles().contains(Role.USER)){
            return "news";
        }

        model.addAttribute("departments", Department.values());
        model.addAttribute("ticket", ticket);

        return "editTicket";
    }

    @PostMapping
    public void addTicket(
            @AuthenticationPrincipal User user,
            @RequestParam Map<String, String> form,
            Model model) {

        //if date is not registered
        try {
            Ticket ticket;
            if (user != null) {
                ticket = new Ticket(user,
                        doctorRepository.findById(1l).get(),
                        Department.valueOf(form.get("department")),
                        user.getPhone(),
                        user.getFirstName(),
                        user.getMiddleName(),
                        user.getLastName(),
                        user.getBirthDate(),
                        user.getAddress(),
                        user.getHouse(),
                        user.getRoom(),
                        scheduleRepository.findById(1l).get(),
                        null);
            } else {
                ticket = new Ticket(null,
                        doctorRepository.findById(1l).get(),
                        Department.valueOf(form.get("department")),
                        form.get("phone"),
                        form.get("firstName"),
                        form.get("middleName"),
                        form.get("lastName"),
                        LocalDate.parse(form.get("birthDate")),
                        form.get("address"),
                        form.get("house"),
                        form.get("room"),
                        scheduleRepository.findById(1l).get(),
                        null);
            }
            ticketRepository.save(ticket);
            model.addAttribute("response", "success");
        } catch (DateTimeParseException e) {
            model.addAttribute("response", "error");
            e.printStackTrace();
        }
        model.addAttribute("departments", Department.values());
        //if not registered show error
    }

    @PostMapping("/edit/{ticket}")
    public String saveEditedTicket(
            @PathVariable Ticket ticket,
            @RequestParam Map<String, String> form,
            Model model) {

        ticket.setResult(form.get("result"));
        try {
            ticketRepository.save(ticket);
            model.addAttribute("response", "success");
        } catch (DateTimeParseException e) {
            model.addAttribute("response", "error");
            e.printStackTrace();
        }
        model.addAttribute("departments", Department.values());
        model.addAttribute("ticket", ticket);

        return "editTicket";
    }

}
