package com.BSUIR.HealthFacilityInformationSystem.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@Entity // This tells Hibernate to make a table out of this class
public class NewsPost {
    public NewsPost(final String title, final String text, final String tag, final User author) {
        this.author = author;
        this.title = title;
        this.text = text;
        this.tag = tag;
    }

    public NewsPost() {
    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Заголовок не может быть пустым")
    private String title;
    @NotBlank(message = "Введите текст новости")
    private String text;
    private String tag;

    private String filename;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public String getAuthorName(){
        return author != null
                ? author.getFullName()
                : "<null>";
    }
}
