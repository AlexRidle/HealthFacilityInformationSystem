package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Department;
import com.BSUIR.HealthFacilityInformationSystem.domain.Doctor;
import com.BSUIR.HealthFacilityInformationSystem.domain.Role;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.DoctorRepository;
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
    private final DoctorRepository doctorRepository;

    @Autowired
    public UserController(final UserRepository userRepository, final DoctorRepository doctorRepository) {
        this.userRepository = userRepository;
        this.doctorRepository = doctorRepository;
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
        model.addAttribute("departments", Department.values());
        if(user.getRoles().contains(Role.DOCTOR)){
            Doctor doctor = doctorRepository.findByUser_Id(user.getId());
            model.addAttribute("doctor", doctor);
        }
        return "userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user,
            @RequestParam(required = false, name = "department") String department
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

        try {
            if (doctorRepository.existsByUser_Id(user.getId())) {
                Doctor doctor = doctorRepository.findByUser_Id(user.getId());
                doctor.setDepartment(Department.valueOf(department));
                doctor.setActive(user.getRoles().contains(Role.DOCTOR));
                doctorRepository.save(doctor);
            } else {
                Doctor doctor = new Doctor(user,
                        Department.CARDIOLOGY,
                        false);
                doctorRepository.save(doctor);
            }
        } catch (Exception ignored){
        }

        userRepository.save(user);
        return "redirect:/user";
    }
}
