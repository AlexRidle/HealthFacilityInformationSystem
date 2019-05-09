package com.BSUIR.HealthFacilityInformationSystem.domain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Data
@Entity
public class Ticket {
    public Ticket(final User user, final Doctor doctor,
                  final Department department, final String phone,
                  final String firstName, final String middleName,
                  final String lastName, final LocalDate birthDate, final String address,
                  final String house, final String room,
                  final Schedule schedule, final String result
    ){
        this.user = user;
        this.doctor = doctor;
        this.department = department;
        this.phone = phone;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.address = address;
        this.house = house;
        this.room = room;
        this.schedule = schedule;
        this.result = result;
    }

    public Ticket() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "schedule_id")
    private Schedule schedule;

    @Enumerated(EnumType.STRING)
    private Department department;

    @NotBlank(message = "Необходимо указать номер телефона")
    @Pattern(regexp = "^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,11}$", message = "Недопустимый номер телефона")
    private String phone;
    @NotBlank(message = "Необходимо указать имя")
    @Pattern(regexp = "([A-Za-zА-Яа-я])\\w+", message = "Имя содержит недопустимые символы")
    private String firstName;
    @Pattern(regexp = "([A-Za-zА-Яа-я])\\w+", message = "Отчество содержит недопустимые символы")
    @NotBlank(message = "Необходимо указать отчество")
    private String middleName;
    @Pattern(regexp = "([A-Za-zА-Яа-я])\\w+", message = "Фамилия содержит недопустимые символы")
    @NotBlank(message = "Необходимо указать фамилию")
    private String lastName;
    @NotBlank(message = "Необходимо указать дату рождения")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthDate;
    @NotBlank(message = "Необходимо указать адрес")
    private String address;
    @NotBlank(message = "")
    private String house;
    @NotBlank(message = "")
    private String room;
    private String result;
}
