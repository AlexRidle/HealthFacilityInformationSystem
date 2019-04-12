package com.BSUIR.HealthFacilityInformationSystem.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

    private String phone;
    private String firstName;
    private String middleName;
    private String lastName;
    private LocalDate birthDate;
    private String address;
    private String house;
    private String room;
    private String result;
}
