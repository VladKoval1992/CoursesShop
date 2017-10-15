package net.kovalchuk.courseshop.controller;

import net.kovalchuk.courseshop.service.user.UserAuxiliaryMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    UserAuxiliaryMethods user;

    @RequestMapping
    public String loginPage() {
        return "login";
    }



}
