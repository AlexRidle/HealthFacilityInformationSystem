package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class RegistrationController {
    private final UserService userService;

    @Autowired
    public RegistrationController(final UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model){

        if(!userService.addUser(user)){
            model.put("message", "error");
            return "registration";
        }

        return "redirect:/login";
    }

}
