package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Role;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    private final UserRepository userRepository;

    @Autowired
    public UserController(final UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public String userList(Model model) {
        List<User> users =  userRepository.findAll();
        Collections.reverse(users);
        model.addAttribute("users", users);
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        user.setUsername(form.get("username"));
        user.setFirstName(form.get("firstName"));
        user.setMiddleName(form.get("middleName"));
        user.setLastName(form.get("lastName"));
        user.setBirthDate(LocalDate.parse(form.get("birthDate")));
        user.setEmail(form.get("email"));
        user.setPhone(form.get("phone"));
        user.setAddress(form.get("address"));
        user.setHouse(form.get("house"));
        user.setRoom(form.get("room"));

        user.getRoles().clear();
        user.getRoles().add(Role.valueOf(form.get("inputRole")));

        userRepository.save(user);
        return "redirect:/user";
    }
}
