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

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/account")
@PreAuthorize("isAuthenticated()")
public class AccountController {
    private final UserRepository userRepository;
    private final TicketRepository ticketRepository;

    @Autowired
    public AccountController(final UserRepository userRepository, final TicketRepository ticketRepository) {
        this.userRepository = userRepository;
        this.ticketRepository = ticketRepository;
    }

    @GetMapping
    public String userForm(@AuthenticationPrincipal User user, Model model) {
        List<Ticket> tickets = ticketRepository.findByUser_Id(user.getId());
        model.addAttribute("user", user);
        model.addAttribute("tickets", tickets);
        return "account";
    }

    @PostMapping
    public void userSave(
            @AuthenticationPrincipal User user,
            @RequestParam Map<String, String> form,
            Model model
    ) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User userDetails = (User) authentication.getPrincipal();
        userDetails.setUsername(form.get("username"));
        userDetails.setFirstName(form.get("firstName"));
        userDetails.setMiddleName(form.get("middleName"));
        userDetails.setLastName(form.get("lastName"));
        userDetails.setEmail(form.get("email"));
        userDetails.setPhone(form.get("phone"));
        userDetails.setAddress(form.get("address"));
        userDetails.setHouse(form.get("house"));
        userDetails.setRoom(form.get("room"));

        userRepository.save(userDetails);

        List<Ticket> tickets = ticketRepository.findByUser_Id(user.getId());
        model.addAttribute("user", user);
        model.addAttribute("tickets", tickets);
        model.addAttribute("response", "success");
    }

}
