package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/patient")
@PreAuthorize("hasAnyAuthority('ADMIN','DOCTOR')")
public class PatientController {

    @Autowired
    public PatientController() {
    }

    @GetMapping
    public String patient(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user", user);
        return "patient";
    }

    @PostMapping
    public void patientSave(
            @RequestParam Map<String, String> form,
            Model model) {

    }

}
