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
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Entity
@Data
public class Feedback {
    public Feedback(final String text, final User user) {
        this.user = user;
        this.text = text;
    }

    public Feedback() {
    }

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Данное поле не может быть пустым")
    @Size(min=20, message = "Данное поле не может быть короче 20 символов")
    private String text;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:MI:SS")
    private LocalDateTime feedbackDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    public String getAuthorName(){
        return user != null
                ? user.getFullName()
                : "Неизвестный пользователь";
    }

    public String getFeedbackDate(){
        return feedbackDate.toString().replaceAll("T", " ");
    }
}
