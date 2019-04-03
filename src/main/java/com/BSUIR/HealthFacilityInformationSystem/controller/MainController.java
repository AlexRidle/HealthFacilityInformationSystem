package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Ticket;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    private final TicketRepository ticketRepository;

    @Autowired
    public MainController(final TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
    }

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        final Iterable<Ticket> tickets;
        if (filter == null || filter.isEmpty()) {
            tickets = ticketRepository.findAll();
        } else {
            tickets = ticketRepository.findByDoctor(filter);
        }
        model.addAttribute("tickets", tickets);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String doctor,
            @RequestParam String time,
            @RequestParam String ward,Map<String, Object> model){
        final Ticket ticket = new Ticket(doctor, time, ward, user);
        ticketRepository.save(ticket);
        final Iterable<Ticket> tickets = ticketRepository.findAll();
        model.put("tickets", tickets);
        return "main";
    }
}