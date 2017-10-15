package net.kovalchuk.courseshop.service.user;


import net.kovalchuk.courseshop.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface UserRepository extends JpaRepository<User, Long> {
    @Query("SELECT u FROM User u where u.email = :email")
    User findByLogin(@Param("email") String email);

    @Query("SELECT CASE WHEN COUNT(u) > 0 THEN true ELSE false END FROM User u WHERE u.email = :email")
    boolean existsByLogin(@Param("email") String email);

    @Query("SELECT c FROM User c WHERE LOWER(c.name) LIKE LOWER(CONCAT('%', :pattern, '%'))")
    List<User> findByPattern(@Param("pattern") String pattern, Pageable pageable);

}
