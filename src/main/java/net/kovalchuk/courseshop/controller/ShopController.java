package net.kovalchuk.courseshop.controller;

import net.kovalchuk.courseshop.entity.Courses;
import net.kovalchuk.courseshop.entity.Mail;
import net.kovalchuk.courseshop.service.courses.CoursesService;
import net.kovalchuk.courseshop.service.mail.MailServicce;
import net.kovalchuk.courseshop.service.user.UserAuxiliaryMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class ShopController {
    @Autowired
    private CoursesService coursesService;
    @Autowired
    private MailServicce mailServicce;
    @Autowired
    private UserAuxiliaryMethods user;

    @RequestMapping(value = "/sendMail")
    public String sendMail(@RequestParam String mail) {
        Date dateMail = new Date();
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy 'в' HH:mm:ss");

        Mail dbMail = new Mail(user.currentUser(), mail, format.format(dateMail));

        mailServicce.addMail(dbMail);
        return "sendmail";
    }


    @RequestMapping("/")
    public String index(Model model) {

        model.addAttribute("userName", user.greeting());
        model.addAttribute("coursesList", coursesService.getAllCourses(new Sort(Sort.Direction.DESC, "id")));

        return "index";
    }


    @RequestMapping("/products")
    public String products(Model model) {

        model.addAttribute("coursesList", coursesService.getAllCourses(new Sort(Sort.Direction.DESC, "id")));
        model.addAttribute("userName", user.greeting());
        return "products";
    }

    @RequestMapping("/shoppingcart")
    public String shoppingcart(Model model) {
        model.addAttribute("userName", user.greeting());
        model.addAttribute("coursesList", coursesService.getAllCourses(new Sort(Sort.Direction.DESC, "id")));
        return "shoppingcart";
    }


    @RequestMapping(value = "/description")
    public String description(@RequestParam(value = "nameCourses") String nameCourses, Model model) {

        Courses descriptionCourses = coursesService.getCoursesByName(nameCourses);
        model.addAttribute("coursesList", coursesService.getAllCourses(new Sort(Sort.Direction.DESC, "id")));
        model.addAttribute("nameCourses", descriptionCourses.getNameCourses());
        model.addAttribute("price", descriptionCourses.getPrice());
        model.addAttribute("descriptionOfCourses", descriptionCourses.getDescriptionOfCourses());
        model.addAttribute("userName", user.greeting());
        return "productdetail";
    }


    @RequestMapping(value = "/deleteCourseShoppingcart")
    public String deleteCourseShoppingcart(@RequestParam(value = "id") String id, HttpSession httpSession) {
        ArrayList<Courses> courses = (ArrayList) httpSession.getAttribute("selectedCourses");
        Integer sizeShoppingCart = (Integer) httpSession.getAttribute("sizeShoppingCart");
        Integer costOfCourses = (Integer) httpSession.getAttribute("costOfCourses");
        httpSession.setAttribute("costOfCourses", costOfCourses = costOfCourses - courses.get(Integer.parseInt(id)).getPrice());
        courses.remove(Integer.parseInt(id));
        httpSession.setAttribute("selectedCourses", courses);
        httpSession.setAttribute("sizeShoppingCart", sizeShoppingCart = courses.size());

        return "redirect:/shoppingcart";
    }

    @RequestMapping("/cabinet")
    public String cabinet(Model model) {
        model.addAttribute("userName", user.greeting());
        return "cabinet";
    }

    @RequestMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("userName", user.greeting());
        return "contact";
    }


    @RequestMapping(value = "/search_courses_index", method = RequestMethod.POST)
    public String searchCoursesIndex(@RequestParam String pattern, Model model) {
        model.addAttribute("coursesList", coursesService.findByPattern(pattern, null));
        model.addAttribute("userName", user.greeting());
        return "products";
    }

}
