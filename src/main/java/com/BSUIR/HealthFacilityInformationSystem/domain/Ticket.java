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
@Entity // This tells Hibernate to make a table out of this class
public class Ticket {
    public Ticket(final String doctor, final String time, String ward, User patient) {
        this.doctor = doctor;
        this.time = time;
        this.ward = ward;
        this.patient = patient;
    }

    public Ticket() {
    }

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    private String doctor;

    private String time;

    private String ward;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User patient;

    public String getPatientName(){
        return patient != null
                ? patient.getFirstName() + " " + patient.getMiddleName() + " " + patient.getLastName()
                : "<null>";
    }
}
