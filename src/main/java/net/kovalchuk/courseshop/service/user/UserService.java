package net.kovalchuk.courseshop.service.user;

import net.kovalchuk.courseshop.entity.User;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UserService {
    User getUserByLogin(String email);
    boolean existsByLogin(String email);
    void addUser(User customUser);
    List<User> getAllUsers();
    void deleteUser(long id[]);
    List<User> findByPattern(String pattern, Pageable pageable);

}
