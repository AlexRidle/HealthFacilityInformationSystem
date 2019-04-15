package com.BSUIR.HealthFacilityInformationSystem.domain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.LocalDateTime;

@Data
@Entity
public class Schedule {
    public Schedule(final Doctor doctor, final LocalDateTime scheduleDate, final boolean registered) {
        this.doctor = doctor;
        this.scheduleDate = scheduleDate;
        this.registered = registered;
    }

    public Schedule() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:MI:SS")
    private LocalDateTime scheduleDate;

    private boolean registered;

    public String getLocalDateTime(){
        return scheduleDate.toString().replaceAll("T", " ");
    }
}
