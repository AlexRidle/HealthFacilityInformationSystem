package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.repository.NewsPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InfoController {

    @Autowired
    public InfoController(){}

    @GetMapping("/contacts")
    public String contacts(Model model) {
        return "contacts";
    }

    @GetMapping("/about")
    public String about(Model model) {
        return "about";
    }

}
