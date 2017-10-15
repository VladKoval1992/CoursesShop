package net.kovalchuk.courseshop.service.courses;


import net.kovalchuk.courseshop.entity.Courses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CoursesServiceImpl implements CoursesService{
    @Autowired
    private CoursesRepository coursesRepository;

    @Override
    @Transactional(readOnly = true)
    public Courses getCoursesByName(String nameCourses) {
        return coursesRepository.findByCourses(nameCourses);
    }

    @Override
    @Transactional
    public void addCourses(Courses customCourses) {
        coursesRepository.save(customCourses);
    }


    @Override
    @Transactional
    public List<Courses> getAllCourses(Sort sort) {


        return coursesRepository.findAll(sort);
    }

    @Override
    @Transactional
    public void deleteCourses(long id[]) {
        for(long i : id){
            coursesRepository.delete(i);
        }
    }

    @Transactional(readOnly=true)
    public List<Courses> findByPattern(String pattern, Pageable pageable) {
        return coursesRepository.findByPattern(pattern, pageable);
    }

}

