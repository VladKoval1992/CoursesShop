package net.kovalchuk.courseshop.controller;

import net.kovalchuk.courseshop.entity.Courses;
import net.kovalchuk.courseshop.entity.Order;
import net.kovalchuk.courseshop.entity.User;
import net.kovalchuk.courseshop.service.courses.CoursesService;
import net.kovalchuk.courseshop.service.mail.MailServicce;
import net.kovalchuk.courseshop.service.order.OrderServicce;
import net.kovalchuk.courseshop.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private CoursesService coursesService;
    @Autowired
    private MailServicce mailServicce;
    @Autowired
    private OrderServicce orderServicce;


    @RequestMapping(value = "/addCourse")
    public String addCourse(@RequestParam(value = "nameCourses") String nameCourses, HttpSession httpSession, Model model) {
        Courses course = coursesService.getCoursesByName(nameCourses);

        ArrayList<Courses> courses = (ArrayList) httpSession.getAttribute("selectedCourses");
        Integer sizeShoppingCart = (Integer) httpSession.getAttribute("sizeShoppingCart");
        Integer costOfCourses = (Integer) httpSession.getAttribute("costOfCourses");

        if (Objects.nonNull(courses)) {
            courses.add(course);
            httpSession.setAttribute("sizeShoppingCart", sizeShoppingCart = courses.size());
            httpSession.setAttribute("costOfCourses", costOfCourses = costOfCourses + course.getPrice());

        } else {
            courses = new ArrayList<>();
            courses.add(course);
            costOfCourses = 0;
            httpSession.setAttribute("selectedCourses", courses);
            httpSession.setAttribute("sizeShoppingCart", sizeShoppingCart = courses.size());
            httpSession.setAttribute("costOfCourses", costOfCourses = costOfCourses + course.getPrice());
        }


        return "redirect:/shoppingcart";
    }


    @RequestMapping(value = "/userdata")
    public String lettersUser(@RequestParam(value = "login") String login, Model model) {
        model.addAttribute("userdata", userService.getUserByLogin(login));
        return "/userdata";
    }

    @RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
    public ResponseEntity<Void> deleteOrder(@RequestParam(value = "toDelete[]", required = false) long toDel[]) {
        if (toDel != null && toDel.length > 0)
            orderServicce.deleteOrder(toDel);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "/letters")
    public String lettersUser(@RequestParam(value = "login") String login,
                              @RequestParam(value = "userName") String userName,
                              Model model) {

        model.addAttribute("mailList", mailServicce.getAllMail(userService.getUserByLogin(login)));
        model.addAttribute("userName", userName);

        return "/letters";
    }


    @RequestMapping("/admincourses")
    public String adminCourses(Model model) {
        model.addAttribute("coursesList", coursesService.getAllCourses(new Sort(Sort.Direction.DESC, "id")));
        return "admincourses";
    }

    @RequestMapping(value = "/newcourses", method = RequestMethod.POST)
    public String updateCourses(@RequestParam String nameCourses,
                                @RequestParam int price,
                                @RequestParam String descriptionOfCourses,
                                @RequestParam MultipartFile emblemOfCourcses) throws Exception {

        Courses dbCouurse = new Courses.Builder()
                .nameCourses(nameCourses)
                .price(price)
                .descriptionOfCourses(descriptionOfCourses)
                .emblemOfCourcses(emblemOfCourcses.getBytes())
                .build();

        if (emblemOfCourcses.isEmpty())
            return "registercourses";
        coursesService.addCourses(dbCouurse);
        return "redirect:/admincourses";
    }

    @RequestMapping(value = "/editCourses")
    public String editCourses(@RequestParam(value = "nameCourses") String nameCourses, Model model) {

        Courses editCourses = coursesService.getCoursesByName(nameCourses);

        model.addAttribute("nameCourses", editCourses.getNameCourses());
        model.addAttribute("price", editCourses.getPrice());
        model.addAttribute("descriptionOfCourses", editCourses.getDescriptionOfCourses());
        return "editcourses";
    }


    @RequestMapping(value = "/changeCourse", method = RequestMethod.POST)
    public String changeCourse(@RequestParam String oldNameCourses,
                               @RequestParam String nameCourses,
                               @RequestParam int price,
                               @RequestParam String descriptionOfCourses,
                               @RequestParam(required = false) MultipartFile emblemOfCourcses) throws Exception {

        Courses changeCourse = coursesService.getCoursesByName(oldNameCourses);
        changeCourse.setNameCourses(nameCourses);
        changeCourse.setPrice(price);
        changeCourse.setDescriptionOfCourses(descriptionOfCourses);

        if (!emblemOfCourcses.isEmpty())
            changeCourse.setEmblemOfCourcses(emblemOfCourcses.getBytes());
        coursesService.addCourses(changeCourse);
        return "redirect:/admincourses";
    }

    @RequestMapping("/registercourses")
    public String registerCourses() {
        return "registercourses";
    }

    @RequestMapping("/adminall")
    public String adminAll() {
        return "adminall";
    }


    @RequestMapping("/admin")
    public String admin(Model model) {
        List<User> userList = userService.getAllUsers();
        model.addAttribute("userList", userList);
        return "admin";
    }


    @RequestMapping(value = "/delete_courses", method = RequestMethod.POST)
    public ResponseEntity<Void> coursesDelete(@RequestParam(value = "toDelete[]", required = false) long toDel[]) {
        if (toDel != null && toDel.length > 0)
            coursesService.deleteCourses(toDel);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "/search_courses", method = RequestMethod.POST)
    public String searchCourses(@RequestParam String pattern, Model model) {
        model.addAttribute("coursesList", coursesService.findByPattern(pattern, null));
        model.addAttribute("back", true);
        return "admincourses";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> userDelete(@RequestParam(value = "toDelete[]", required = false) long toDel[]) {
        if (toDel != null && toDel.length > 0)
            userService.deleteUser(toDel);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@RequestParam String pattern, Model model) {
        model.addAttribute("userList", userService.findByPattern(pattern, null));
        model.addAttribute("back", true);
        return "admin";
    }



    @RequestMapping("/ordersadmin")
    public String ordersAdmin(Model model) {


        List<User> users = userService.getAllUsers();
        ArrayList<User> usersList = new ArrayList<>();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getOrderSize() > 0)
                usersList.add(users.get(i));
        }
        model.addAttribute("usersList", usersList);

        return "ordersadmin";
    }

    @RequestMapping(value = "/ordersalluser")
    public String ordersAllUser(@RequestParam(value = "login") String login, Model model) {

        List<Order> orders = orderServicce.getAllOrder(userService.getUserByLogin(login));

        model.addAttribute("orders", orders);
        return "/ordersalluser";
    }


}
