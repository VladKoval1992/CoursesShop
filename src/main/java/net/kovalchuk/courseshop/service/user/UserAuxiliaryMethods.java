package net.kovalchuk.courseshop.service.user;

import net.kovalchuk.courseshop.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class UserAuxiliaryMethods {

    @Autowired
    private UserService userService;

    public User currentUser() {

        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        return userService.getUserByLogin(login);
    }

    public String greeting() {
        if (SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
            return "Коиристчувач";
        else
            return currentUser().getName();


    }
}
