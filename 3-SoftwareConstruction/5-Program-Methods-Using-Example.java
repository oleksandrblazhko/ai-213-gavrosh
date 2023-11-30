package com.lab9.temperaturechecker.controller;

import com.lab9.temperaturechecker.entity.InformationAnswer;
import com.lab9.temperaturechecker.entity.InformationRequest;
import com.lab9.temperaturechecker.entity.Temperature;
import com.lab9.temperaturechecker.entity.User;
import com.lab9.temperaturechecker.service.AnswerService;
import com.lab9.temperaturechecker.service.TemperatureService;
import com.lab9.temperaturechecker.service.RequestService;
import com.lab9.temperaturechecker.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
@Controller
public class MyController {
    private TemperatureService TemperatureService;
    private UserService userService;
    private RequestService requestService;
    private AnswerService answerService;

    @Autowired
    public MyController(TemperatureService TemperatureService, UserService userService, RequestService requestService, AnswerService answerService) {
        this.TemperatureService = TemperatureService;
        this.userService = userService;
        this.requestService = requestService;
        this.answerService = answerService;
    }

    @RequestMapping("/")
    public String login() {
        return "login";
    }
    @PostMapping("/doLogin")
    public String doLogin(@RequestParam String username, @RequestParam String email, @RequestParam String workplace) {
        if (username.equals("Artem") && email.equals("12345678") && workplace.equals("Odessa")) {
            userService.save(new User("Artem", "12345678", "Odessa"));
            return "main-page";
        }
        return "login";
    }

  
    @PostMapping("/air-clear-info")
    public String TemperatureInfo(@RequestParam String username, @RequestParam String workplace, Model model) {

        Temperature Temperature = new Temperature();
        String TemperatureInfo = Temperature.getTemperatureInfo(workplace);
        model.addAttribute("TemperatureInfo", TemperatureInfo);

        return "Temperature-info";
    }

}
