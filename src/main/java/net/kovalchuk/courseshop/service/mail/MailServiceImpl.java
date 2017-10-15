package net.kovalchuk.courseshop.service.mail;


import net.kovalchuk.courseshop.entity.Mail;
import net.kovalchuk.courseshop.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MailServiceImpl implements MailServicce {
    @Autowired
    private MailRepository mailRepository;

    @Override
    @Transactional
    public void addMail(Mail mail) {
        mailRepository.save(mail);
    }

    @Transactional(readOnly = true)
    public List<Mail> getAllMail(User user) {
        return mailRepository.findMailByUser(user);
    }

    @Override
    @Transactional
    public void deleteMail(long id[]) {
        for (long i : id) {
            mailRepository.delete(i);
        }
    }


}
