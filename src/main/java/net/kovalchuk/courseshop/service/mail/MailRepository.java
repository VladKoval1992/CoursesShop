package net.kovalchuk.courseshop.service.mail;

import net.kovalchuk.courseshop.entity.Mail;
import net.kovalchuk.courseshop.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.util.List;

public interface MailRepository extends JpaRepository<Mail, Long> {
    @Query("SELECT c FROM Mail c WHERE c.user = :user")
    List<Mail> findMailByUser(@Param("user") User user);

}
