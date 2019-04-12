package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Ticket;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.TicketRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/schedule")
@PreAuthorize("hasAnyAuthority('ADMIN','OPERATOR')")
public class ScheduleController {

    @Autowired
    public ScheduleController() {
    }

    @GetMapping
    public String schedule(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user", user);
        return "schedule";
    }

    @PostMapping
    public void scheduleSave(
            @RequestParam Map<String, String> form,
            Model model) {

    }

}
