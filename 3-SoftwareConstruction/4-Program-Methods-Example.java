package com.lab9.temperaturechecker.entity;

import jakarta.persistence.*;

@Entity
public class Temperature{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "email")
    private String email;
    @Column(name = "work_place")
    private String workplace;
    @Column(name = "temperature ")
    private String Temperature ;
    //method
    public String getTemperatureInfo(String user, String email, String workplace) {
        String result = "";
        if (email.length() > 35 || !user.matches("^[a-zA-Z\\s]+$") || user.isBlank() || workplace.length() > 20) {
        }
        result = """
                        Your work place now has excellent Temperature quality. 
                        The level of Temperature at the moment meets all norms and safety standards. 
                        You can enjoy fresh air and soft warm with safe living conditions.
                        Temperature = 25 degrees
                    """;
        return result;
    }

    public Temperature(String email, String workplace, String Temperature) {
        this.email = email;
        this.workplace = workplace;
        this.Temperature  = Temperature;
    }

    public Temperature() {

    }

    @Override
    public String toString() {
        return "Temperature{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", workplace='" + workplace + '\'' +
                ", Temperature='" + Temperature  + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getemail() {
        return email;
    }

    public void setemail(String email) {
        this.email = email;
    }

    public String getworkplace() {
        return workplace;
    }

    public void setworkplace(String workplace) {
        this.workplace = workplace;
    }

    public String getAirCondition() {
        return airCondition;
    }

    public void setAirCondition (String airCondition) {
        this.airCondition = airCondition;
    }
}
