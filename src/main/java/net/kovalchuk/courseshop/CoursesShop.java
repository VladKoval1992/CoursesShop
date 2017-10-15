package net.kovalchuk.courseshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class CoursesShop {
    public static void main(String[] args) {
        SpringApplication.run(CoursesShop.class, args);
    }

//    @Bean
//    public CommandLineRunner demo(final UserService userService) {
//        return new CommandLineRunner() {
//            @Override
//            public void run(String... strings) throws Exception {
//
//                userService.addUser(new User.Builder()
//                        .name("Адмін")
//                        .email("admin")
//                        .password("011c945f30ce2cbafc452f39840f025693339c42")
//                        .role(UserRole.ADMIN)
//                        .build());
//                userService.addUser(new User.Builder()
//                        .name("Юзер")
//                        .email("user")
//                        .password("011c945f30ce2cbafc452f39840f025693339c42")
//                        .role(UserRole.USER)
//                        .build());
//                userService.addUser(new User.Builder()
//                        .name("Юзер1")
//                        .email("user1")
//                        .password("011c945f30ce2cbafc452f39840f025693339c42")
//                        .role(UserRole.USER)
//                        .build());
//
//                           }
//        };
//    }
//
//    @Bean
//    public CommandLineRunner demow2(final CoursesService coursesService) {
//        return new CommandLineRunner() {
//            @Override
//            public void run(String... strings) throws Exception {
//                coursesService.addCourses(new Courses.Builder()
//                .nameCourses("Java Start")
//                .price(3450)
//                .descriptionOfCourses("сильно типизированный объектно-ориентированный язык программирования, разработанный компанией Sun Microsystems (в последующем приобретённой компанией Oracle). Приложения Java обычно транслируются в специальный байт-код, поэтому они могут работать на любой компьютерной архитектуре, с помощью виртуальной Java-машины. Дата официального выпуска — 23 мая 1995 года.")
//                .build());
//
//
//                coursesService.addCourses(new Courses.Builder()
//                        .nameCourses("Java Java")
//                        .price(2345)
//                        .descriptionOfCourses("в последующем приобретённой компанией Oracle). Приложения Java обычно транслируются в специальный байт-код, поэтому они могут работать на любой компьютерной архитектуре, с помощью виртуальной Java-машины. Дата официального выпуска — 23 мая 1995 года.")
//                        .build());
//
//                coursesService.addCourses(new Courses.Builder()
//                        .nameCourses("Java Pro")
//                        .price(2343)
//                        .descriptionOfCourses("в послия Java обычно транслируются в специальный байт-код, поэтому они могут работать на любой компьютерной архитектуре, с помощью виртуальной Java-машины. Дата официального выпуска — 23 мая 1995 года.")
//                        .build());
//            }
//
//
//        };
//    }
}