package net.kovalchuk.courseshop.controller;

import net.kovalchuk.courseshop.service.courses.CoursesService;
import net.kovalchuk.courseshop.service.mail.MailServicce;
import net.kovalchuk.courseshop.service.order.OrderServicce;
import net.kovalchuk.courseshop.service.user.UserAuxiliaryMethods;
import net.kovalchuk.courseshop.service.user.UserRole;
import net.kovalchuk.courseshop.service.user.UserService;
import net.kovalchuk.courseshop.entity.Courses;
import net.kovalchuk.courseshop.entity.Order;
import net.kovalchuk.courseshop.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private CoursesService coursesService;
    @Autowired
    private MailServicce mailServicce;
    @Autowired
    private OrderServicce orderServicce;
    @Autowired
    private UserAuxiliaryMethods user;


    @RequestMapping("/lettersalluser")
    public String lettersalluser(Model model) {
        List<User> users = userService.getAllUsers();
        ArrayList<User> usersList = new ArrayList<>();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getMailSize() > 0)
                usersList.add(users.get(i));
        }
        model.addAttribute("usersList", usersList);

        return "lettersalluser";
    }


    @RequestMapping("/ordersuser")
    public String ordersuser(Model model) {
        List<Order> orders = orderServicce.getAllOrder(userService.getUserByLogin(user.currentUser().getEmail()));
        model.addAttribute("userName", user.greeting());
        model.addAttribute("orders", orders);
        model.addAttribute("size", orders.size());
        return "ordersuser";
    }


    @RequestMapping(value = "/userletters")
    public String userletters(Model model) {
        model.addAttribute("mailList", mailServicce.getAllMail(userService.getUserByLogin(user.currentUser().getEmail())));
        model.addAttribute("size", mailServicce.getAllMail(userService.getUserByLogin(user.currentUser().getEmail())).size());
        model.addAttribute("userName", user.greeting());
        return "userletters";
    }


    @RequestMapping(value = "/deleteMail", method = RequestMethod.POST)
    public ResponseEntity<Void> deleteMail(@RequestParam(value = "toDelete[]", required = false) long toDel[]) {
        if (toDel != null && toDel.length > 0)
            mailServicce.deleteMail(toDel);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    @RequestMapping("/checkout")
    public String checkout(Model model, HttpSession httpSession) {

        if (Objects.nonNull(httpSession.getAttribute("selectedCourses"))) {
            model.addAttribute("userName", user.greeting());
            long orderNumber = System.currentTimeMillis();
            model.addAttribute("numberOrder", orderNumber);
            List<Courses> courses = new ArrayList<>();
            List<Courses> coursesList = (List) httpSession.getAttribute("selectedCourses");
            int orderprice = (int) httpSession.getAttribute("costOfCourses");
            for (int i = 0; i < coursesList.size(); i++)
                courses.add(coursesService.getCoursesByName(coursesList.get(i).getNameCourses()));

            Order order = new Order(userService.getUserByLogin(user.currentUser().getEmail()), orderNumber, orderprice, courses);
            orderServicce.addOrder(order);

            httpSession.removeAttribute("selectedCourses");
            httpSession.removeAttribute("sizeShoppingCart");
            httpSession.removeAttribute("costOfCourses");
            return "checkout";
        } else
            return "redirect:/";
    }


    @RequestMapping("/photo/{emblem}")
    public ResponseEntity<byte[]> onPhoto(@PathVariable("emblem") String name) {
        Courses nameCourse = coursesService.getCoursesByName(name);
        byte[] emblem = nameCourse.getEmblemOfCourcses();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(emblem, headers, HttpStatus.OK);
    }


    @RequestMapping(value = "/editUser")
    public String editUser(Model model) {

        User us = userService.getUserByLogin(user.currentUser().getEmail());
        model.addAttribute("name", us.getName());
        model.addAttribute("lastName", us.getLastName());
        model.addAttribute("birthday", us.getBirthday());
        model.addAttribute("sex", us.getSex());
        model.addAttribute("email", us.getEmail());
        model.addAttribute("password", us.getPassword());
        model.addAttribute("phone", us.getPhone());
        model.addAttribute("adres", us.getAdres());
        model.addAttribute("city", us.getCity());
        model.addAttribute("country", us.getCountry());
        return "editUser";
    }


    @RequestMapping(value = "/changeUser", method = RequestMethod.POST)
    public String changeUser(@RequestParam String name,
                             @RequestParam String lastName,
                             @RequestParam String birthday,
                             @RequestParam String sex,
                             @RequestParam String email,
                             @RequestParam String password,
                             @RequestParam String phone,
                             @RequestParam String adres,
                             @RequestParam String city,
                             @RequestParam String country) {


        User changeUser = userService.getUserByLogin(user.currentUser().getEmail());
        changeUser.setName(name);
        changeUser.setLastName(lastName);
        changeUser.setBirthday(birthday);
        changeUser.setSex(sex);
        changeUser.setEmail(email);
        if (!changeUser.getPassword().equals(password)) {
            ShaPasswordEncoder encoder = new ShaPasswordEncoder();
            String passHash = encoder.encodePassword(password, null);
            changeUser.setPassword(passHash);
        }
        changeUser.setPhone(phone);
        changeUser.setAdres(adres);
        changeUser.setCity(city);
        changeUser.setCountry(country);
        userService.addUser(changeUser);

        return "redirect:/cabinet";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model) {

        model.addAttribute("login", user.greeting());
        return "unauthorized";
    }



    @RequestMapping(value = "/newuser", method = RequestMethod.POST)
    public String update(@RequestParam String name,
                         @RequestParam String lastName,
                         @RequestParam String birthday,
                         @RequestParam String sex,
                         @RequestParam String email,
                         @RequestParam String password,
                         @RequestParam String phone,
                         @RequestParam String adres,
                         @RequestParam String city,
                         @RequestParam String country,
                         @RequestParam String role,
                         Model model) {
        if (userService.existsByLogin(email)) {
            model.addAttribute("exists", true);
            return "register";
        }
        UserRole userRole;

        if (role.equals("ADMIN"))
            userRole = UserRole.ADMIN;
        else
            userRole = UserRole.USER;

        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        String passHash = encoder.encodePassword(password, null);
        User dbUser = new User.Builder()
                .name(name)
                .lastName(lastName)
                .birthday(birthday)
                .sex(sex)
                .email(email)
                .password(passHash)
                .phone(phone)
                .adres(adres)
                .city(city)
                .country(country)
                .role(userRole)
                .build();


        userService.addUser(dbUser);
        return "redirect:/";
    }


    @RequestMapping("/register")
    public String register() {
        return "register";
    }


}
