package net.kovalchuk.courseshop.entity;


import javax.persistence.*;

@Entity
@Table(name="MAIL")
public class Mail {
    @Id
    @GeneratedValue
    private long id;

    @ManyToOne
    @JoinColumn(name="USER_ID")
    private User user;



    @Lob
    private String mail;
    private String time;

    public Mail(){}

    public Mail(User user, String mail, String time){
        this.user = user;
        this.mail = mail;
        this.time = time;
    }


    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
}
