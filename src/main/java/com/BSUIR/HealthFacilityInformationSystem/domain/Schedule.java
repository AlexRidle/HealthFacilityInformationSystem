package com.BSUIR.HealthFacilityInformationSystem.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Data
@Entity
public class Schedule {
    public Schedule(final Doctor doctor, final String dateAndTime) {
        this.doctor = doctor;
        this.dateAndTime = dateAndTime;
    }

    public Schedule() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    private String dateAndTime;

    private boolean registered;
}
