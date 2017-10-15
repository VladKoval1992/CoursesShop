package net.kovalchuk.courseshop.service.courses;

import net.kovalchuk.courseshop.entity.Courses;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;


public interface CoursesService {
    Courses getCoursesByName(String nameCourses);
    void addCourses(Courses customCourses);
    List<Courses> getAllCourses(Sort sort);
    void deleteCourses(long id[]);
    List<Courses> findByPattern(String pattern, Pageable pageable);

}



