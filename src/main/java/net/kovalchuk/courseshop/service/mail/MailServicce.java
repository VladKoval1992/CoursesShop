package net.kovalchuk.courseshop.service.mail;

import net.kovalchuk.courseshop.entity.Mail;
import net.kovalchuk.courseshop.entity.User;

import java.util.List;

public interface MailServicce {
    void addMail(Mail mail);
    List<Mail> getAllMail(User user);
    void deleteMail(long id[]);


}
