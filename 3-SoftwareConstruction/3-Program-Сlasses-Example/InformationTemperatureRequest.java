package com.lab9.temperaturechecker.entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "InformationTemperstureRequest")
public class InformationTemperstureRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "request_title")
    private String requestTitle;
    @Column(name = "description")
    private String description;
    @Column(name = "format")
    private String format;
    @Column(name = "date")
    private LocalDate date;
    @OneToOne
    @JoinColumn(name = "userno")
    private User user;

    public InformationTemperstureRequest(String requestTitle, String description, String format, LocalDate date, User user) {
        this.requestTitle = requestTitle;
        this.description = description;
        this.format = format;
        this.date = date;
        this.user = user;
    }

    public InformationTemperstureRequest() {

    }

    @Override
    public String toString() {
        return "InformationTemperstureRequest{" +
                "id=" + id +
                ", requestTitle='" + requestTitle + '\'' +
                ", description='" + description + '\'' +
                ", format='" + format + '\'' +
                ", date='" + date + '\'' +
                ", user=" + user +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRequestTitle() {
        return requestTitle;
    }

    public void setRequestTitle(String requestTitle) {
        this.requestTitle = requestTitle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String fordatemat) {
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
