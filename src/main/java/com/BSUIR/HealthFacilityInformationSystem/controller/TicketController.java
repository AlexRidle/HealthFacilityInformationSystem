package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Department;
import com.BSUIR.HealthFacilityInformationSystem.domain.Doctor;
import com.BSUIR.HealthFacilityInformationSystem.domain.Role;
import com.BSUIR.HealthFacilityInformationSystem.domain.Schedule;
import com.BSUIR.HealthFacilityInformationSystem.domain.Ticket;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.domain.dto.CaptchaResponseDto;
import com.BSUIR.HealthFacilityInformationSystem.repository.DoctorRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.ScheduleRepository;
import com.BSUIR.HealthFacilityInformationSystem.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class TicketController {
    private static final String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    private final TicketRepository ticketRepository;
    private final DoctorRepository doctorRepository;
    private final ScheduleRepository scheduleRepository;
    private final RestTemplate restTemplate;

    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    public TicketController(final TicketRepository ticketRepository, final DoctorRepository doctorRepository, final ScheduleRepository scheduleRepository, final RestTemplate restTemplate) {
        this.ticketRepository = ticketRepository;
        this.doctorRepository = doctorRepository;
        this.scheduleRepository = scheduleRepository;
        this.restTemplate = restTemplate;
    }

    @GetMapping("/ticket")
    public String ticket(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("departments", Department.values());
        return "ticket/ticket";
    }

    @GetMapping("/ticket/edit/{ticket}")
    public String editTicket(
            @AuthenticationPrincipal User user,
            @PathVariable Ticket ticket,
            @RequestParam Map<String, String> form,
            Model model) {

        if(user.getRoles().contains(Role.USER)){
            return "/";
        }

        model.addAttribute("departments", Department.values());
        model.addAttribute("ticket", ticket);

        return "editTicket";
    }

    @PostMapping("/ticket")
    public String getFormOne(
            @AuthenticationPrincipal User user,
            @Valid Ticket ticket,
            BindingResult bindingResult,
            @RequestParam Map<String, String> form,
            Model model) {

        //if date is not registered
        try {
            if (user != null) {
                ticket.setUser(user);
                ticket.setDepartment(Department.valueOf(form.get("department")));
                ticket.setPhone(user.getPhone());
                ticket.setFirstName(user.getFirstName());
                ticket.setMiddleName(user.getMiddleName());
                ticket.setLastName(user.getLastName());
                ticket.setBirthDate(user.getBirthDate());
                ticket.setAddress(user.getAddress());
                ticket.setHouse(user.getHouse());
                ticket.setRoom(user.getRoom());
            } else {
                ticket.setDepartment(Department.valueOf(form.get("department")));
                ticket.setPhone(form.get("phone"));
                ticket.setFirstName(form.get("firstName"));
                ticket.setMiddleName(form.get("middleName"));
                ticket.setLastName(form.get("lastName"));
                ticket.setBirthDate(LocalDate.parse(form.get("birthDate")));
                ticket.setAddress(form.get("address"));
                ticket.setHouse(form.get("house"));
                ticket.setRoom(form.get("room"));
            }
            if(bindingResult.hasErrors() && user == null){
                Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
                model.mergeAttributes(errorsMap);
                model.addAttribute("ticket", ticket);
                model.addAttribute("departments", Department.values());
                return "ticket/ticket";
            } else {
                model.addAttribute("ticket", ticket);
                List<Doctor> doctors = doctorRepository.findAllByActiveAndDepartment(true, Department.valueOf(form.get("department")));
                model.addAttribute("user", user);
                if(doctors.isEmpty()){
                    model.addAttribute("response", "empty");
                    model.addAttribute("departments", Department.values());
                    return "ticket/ticket";
                }
                model.addAttribute("doctors", doctors);
                model.addAttribute("department", Department.valueOf(form.get("department")));
                return "ticket/ticket2";
            }
        } catch (DateTimeParseException e) {
            model.addAttribute("response", "error");
            model.addAttribute("user", user);
            model.addAttribute("departments", Department.values());
            return "ticket/ticket";
        }
    }

    @PostMapping("/ticket2")
    public String getFormTwo(
            @AuthenticationPrincipal User user,
            @Valid Ticket ticket,
            BindingResult bindingResult,
            @RequestParam Map<String, String> form,
            Model model) {

        //if date is not registered
        try {
            if (user != null) {
                ticket.setDoctor(doctorRepository.findById(Long.valueOf(form.get("doctor"))).get());
                ticket.setUser(user);
                ticket.setDepartment(Department.valueOf(form.get("department")));
                ticket.setPhone(user.getPhone());
                ticket.setFirstName(user.getFirstName());
                ticket.setMiddleName(user.getMiddleName());
                ticket.setLastName(user.getLastName());
                ticket.setBirthDate(user.getBirthDate());
                ticket.setAddress(user.getAddress());
                ticket.setHouse(user.getHouse());
                ticket.setRoom(user.getRoom());
            } else {
                ticket.setDoctor(doctorRepository.findById(Long.valueOf(form.get("doctor"))).get());
                ticket.setDepartment(Department.valueOf(form.get("department")));
                ticket.setPhone(form.get("phone"));
                ticket.setFirstName(form.get("firstName"));
                ticket.setMiddleName(form.get("middleName"));
                ticket.setLastName(form.get("lastName"));
                ticket.setBirthDate(LocalDate.parse(form.get("birthDate")));
                ticket.setAddress(form.get("address"));
                ticket.setHouse(form.get("house"));
                ticket.setRoom(form.get("room"));
            }
            if(bindingResult.hasErrors() && user == null){
                Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
                model.mergeAttributes(errorsMap);
                model.addAttribute("response", "empty");
                List<Doctor> doctors = doctorRepository.findAllByActiveAndDepartment(true, Department.valueOf(form.get("department")));
                model.addAttribute("doctors", doctors);
                model.addAttribute("department", Department.valueOf(form.get("department")));
                return "ticket/ticket2";
            } else {
                model.addAttribute("ticket", ticket);
                List<Schedule> schedules = scheduleRepository.findByDoctor_IdAndRegistered(Long.valueOf(form.get("doctor")), false);
                List<Doctor> doctors = doctorRepository.findAllByActiveAndDepartment(true, Department.valueOf(form.get("department")));
                model.addAttribute("user", user);
                if(schedules.isEmpty()) {
                    model.addAttribute("response", "empty");
                    model.addAttribute("doctors", doctors);
                    model.addAttribute("department", Department.valueOf(form.get("department")));
                    return "ticket/ticket2";
                }
                model.addAttribute("department", Department.valueOf(form.get("department")));
                model.addAttribute("schedules", schedules);
                return "ticket/ticket3";
            }
        } catch (DateTimeParseException e) {
            model.addAttribute("response", "error");
            model.addAttribute("user", user);
            model.addAttribute("departments", Department.values());
            return "ticket/ticket";
        }

    }

    @PostMapping("/ticket3")
    public String getFormThree(@RequestParam("g-recaptcha-response") String captchaResponse,
            @AuthenticationPrincipal @Valid User user,
            @Valid Ticket ticket,
            BindingResult bindingResult,
            @RequestParam Map<String, String> form,
            Model model) {
        //if date is not registered
        try {
            if (user != null) {
                ticket.setDoctor(doctorRepository.findById(Long.valueOf(form.get("doctor"))).get());
                ticket.setUser(user);
                ticket.setDepartment(Department.valueOf(form.get("department")));
                ticket.setPhone(user.getPhone());
                ticket.setFirstName(user.getFirstName());
                ticket.setMiddleName(user.getMiddleName());
                ticket.setLastName(user.getLastName());
                ticket.setBirthDate(user.getBirthDate());
                ticket.setAddress(user.getAddress());
                ticket.setHouse(user.getHouse());
                ticket.setRoom(user.getRoom());
                ticket.setSchedule(scheduleRepository.findById(Long.valueOf(form.get("schedule"))).get());
            } else {
                ticket.setDoctor(doctorRepository.findById(Long.valueOf(form.get("doctor"))).get());
                ticket.setDepartment(Department.valueOf(form.get("department")));
                ticket.setPhone(form.get("phone"));
                ticket.setFirstName(form.get("firstName"));
                ticket.setMiddleName(form.get("middleName"));
                ticket.setLastName(form.get("lastName"));
                ticket.setBirthDate(LocalDate.parse(form.get("birthDate")));
                ticket.setAddress(form.get("address"));
                ticket.setHouse(form.get("house"));
                ticket.setRoom(form.get("room"));
                ticket.setSchedule(scheduleRepository.findById(Long.valueOf(form.get("schedule"))).get());
            }
            String url = String.format(CAPTCHA_URL, secret, captchaResponse);
            CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

            if(!response.isSuccess()){
                model.addAttribute("message", "captcha");
                List<Schedule> schedules = scheduleRepository.findByDoctor_IdAndRegistered(Long.valueOf(form.get("doctor")), false);
                model.addAttribute("schedules", schedules);
                model.addAttribute("ticket", ticket);
                model.addAttribute("department", Department.valueOf(form.get("department")));
                if(bindingResult.hasErrors() && user == null){
                    Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
                    model.mergeAttributes(errorsMap);
                }
                return "ticket/ticket3";
            }

            if(bindingResult.hasErrors() && user == null){
                Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
                model.mergeAttributes(errorsMap);
                List<Schedule> schedules = scheduleRepository.findByDoctor_IdAndRegistered(Long.valueOf(form.get("doctor")), false);
                model.addAttribute("schedules", schedules);
                model.addAttribute("ticket", ticket);
                model.addAttribute("department", Department.valueOf(form.get("department")));
                return "ticket/ticket3";
            } else {
                model.addAttribute("ticket", ticket);
                ticketRepository.save(ticket);
                Schedule schedule = scheduleRepository.findById(Long.valueOf(form.get("schedule"))).get();
                schedule.setRegistered(true);
                scheduleRepository.save(schedule);
                return "ticket/ticket_final";
            }
        } catch (DateTimeParseException e) {
            model.addAttribute("response", "error");
            model.addAttribute("user", user);
            model.addAttribute("departments", Department.values());
            return "ticket/ticket";

//            model.addAttribute("response", "success");
//        } catch (DateTimeParseException e) {
//            model.addAttribute("response", "error");
//            e.printStackTrace();
//        }
//        model.addAttribute("departments", Department.values());
//        //if not registered show error
//        return "ticket/ticket";
        }

    }

//    @PostMapping
//    public String addTicket(
//            @AuthenticationPrincipal User user,
//            @RequestParam Map<String, String> form,
//            Model model) {
//
//        //if date is not registered
//        try {
//            Ticket ticket;
//            if (user != null) {
//                ticket = new Ticket(user,
//                        doctorRepository.findById(1l).get(),
//                        Department.valueOf(form.get("department")),
//                        user.getPhone(),
//                        user.getFirstName(),
//                        user.getMiddleName(),
//                        user.getLastName(),
//                        user.getBirthDate(),
//                        user.getAddress(),
//                        user.getHouse(),
//                        user.getRoom(),
//                        scheduleRepository.findById(1l).get(),
//                        null);
//            } else {
//                ticket = new Ticket(null,
//                        doctorRepository.findById(1l).get(),
//                        Department.valueOf(form.get("department")),
//                        form.get("phone"),
//                        form.get("firstName"),
//                        form.get("middleName"),
//                        form.get("lastName"),
//                        LocalDate.parse(form.get("birthDate")),
//                        form.get("address"),
//                        form.get("house"),
//                        form.get("room"),
//                        scheduleRepository.findById(1l).get(),
//                        null);
//            }
//            ticketRepository.save(ticket);
//            model.addAttribute("response", "success");
//        } catch (DateTimeParseException e) {
//            model.addAttribute("response", "error");
//            e.printStackTrace();
//        }
//        model.addAttribute("departments", Department.values());
//        //if not registered show error
//        return "ticket/ticket";
//    }

    @PostMapping("/ticket/edit/{ticket}")
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
