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
public class NewsPost {
    public NewsPost(final String text, final String tag, User author) {
        this.author = author;
        this.text = text;
        this.tag = tag;
    }

    public NewsPost() {
    }

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    private String text;

    private String filename;

    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public String getAuthorName(){
        return author != null
                ? author.getFullName()
                : "<null>";
    }
}
