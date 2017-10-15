package net.kovalchuk.courseshop.service.courses;

import net.kovalchuk.courseshop.entity.Courses;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface CoursesRepository extends JpaRepository<Courses, Long>{


        @Query("SELECT u FROM Courses u where u.nameCourses = :nameCourses")
        Courses findByCourses(@Param("nameCourses") String nameCourses);

        @Query("SELECT c FROM Courses c WHERE LOWER(c.nameCourses) LIKE LOWER(CONCAT('%', :pattern, '%'))")
        List<Courses> findByPattern(@Param("pattern") String pattern, Pageable pageable);


}
