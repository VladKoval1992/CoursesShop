package net.kovalchuk.courseshop.service.user;

import net.kovalchuk.courseshop.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public User getUserByLogin(String login) {
        return userRepository.findByLogin(login);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean existsByLogin(String login) {
        return userRepository.existsByLogin(login);
    }


    @Override
    @Transactional
    public void addUser(User customUser) {
        userRepository.save(customUser);
    }

    @Override
    @Transactional
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    @Transactional
    public void deleteUser(long id[]) {
        for(long i : id){
            userRepository.delete(i);
        }
    }

    @Transactional(readOnly=true)
    public List<User> findByPattern(String pattern, Pageable pageable) {
        return userRepository.findByPattern(pattern, pageable);
    }


}
