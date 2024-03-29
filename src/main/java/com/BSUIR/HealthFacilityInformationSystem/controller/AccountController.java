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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Collections;
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
        Collections.reverse(tickets);
        model.addAttribute("user", user);
        model.addAttribute("tickets", tickets);
        return "account";
    }

    @PostMapping
    public void userSave(
            @AuthenticationPrincipal User user_auth,
            @Valid User user,
            BindingResult bindingResult,
            @RequestParam Map<String, String> form,
            Model model
    ) {
        if(bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);

            model.addAttribute("user", user);
        } else {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User userDetails = (User) authentication.getPrincipal();
            userDetails.setUsername(form.get("username"));
            userDetails.setFirstName(form.get("firstName"));
            userDetails.setMiddleName(form.get("middleName"));
            userDetails.setLastName(form.get("lastName"));
            userDetails.setBirthDate(LocalDate.parse(form.get("birthDate")));
            userDetails.setEmail(form.get("email"));
            userDetails.setPhone(form.get("phone"));
            userDetails.setAddress(form.get("address"));
            userDetails.setHouse(form.get("house"));
            userDetails.setRoom(form.get("room"));

            userRepository.save(userDetails);

            model.addAttribute("user", user_auth);
            model.addAttribute("response", "success");
        }

        List<Ticket> tickets = ticketRepository.findByUser_Id(user_auth.getId());
        Collections.reverse(tickets);
        model.addAttribute("response", "invalid");
        model.addAttribute("tickets", tickets);
    }

}
