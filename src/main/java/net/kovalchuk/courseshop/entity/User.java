package net.kovalchuk.courseshop.entity;

import net.kovalchuk.courseshop.service.user.UserRole;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="USER")
public class User {

    @Id
    @GeneratedValue
    private long id;

    @OneToMany(mappedBy="user", cascade = CascadeType.ALL)
    private List<Mail> mail;

    @OneToMany(mappedBy="user", cascade = CascadeType.ALL)
    private List<Order> order;



    private String name;
    private String lastName;

    @Enumerated(EnumType.STRING)
    private UserRole role;

    private String birthday;
    private String sex;
    private String email;
    private String password;
    private String phone;
    private String adres;
    private String city;
    private String country;

    private int mailSize;
    private int orderSize;



    public User() {}

    private User(Builder builder) {
        setId(builder.id);
        mail = builder.mail;
        setName(builder.name);
        setLastName(builder.lastName);
        setRole(builder.role);
        setBirthday(builder.birthday);
        setSex(builder.sex);
        setEmail(builder.email);
        setPassword(builder.password);
        setPhone(builder.phone);
        setAdres(builder.adres);
        setCity(builder.city);
        setCountry(builder.country);
        setMailSize(builder.mailSize);
    }

    public int getOrderSize() {
        return order.size();
    }

    public void setOrderSize(int orderSize) {
        this.orderSize = orderSize;
    }

    public int getMailSize() {
        return mail.size();
    }

    public void setMailSize(int mailSize) {
        this.mailSize = mailSize;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public static final class Builder {
        private long id;
        private List<Mail> mail;
        private String name;
        private String lastName;
        private UserRole role;
        private String birthday;
        private String sex;
        private String email;
        private String password;
        private String phone;
        private String adres;
        private String city;
        private String country;
        private int mailSize;

        public Builder() {
        }

        public Builder id(long val) {
            id = val;
            return this;
        }

        public Builder mail(List<Mail> val) {
            mail = val;
            return this;
        }

        public Builder name(String val) {
            name = val;
            return this;
        }

        public Builder lastName(String val) {
            lastName = val;
            return this;
        }

        public Builder role(UserRole val) {
            role = val;
            return this;
        }

        public Builder birthday(String val) {
            birthday = val;
            return this;
        }

        public Builder sex(String val) {
            sex = val;
            return this;
        }

        public Builder email(String val) {
            email = val;
            return this;
        }

        public Builder password(String val) {
            password = val;
            return this;
        }

        public Builder phone(String val) {
            phone = val;
            return this;
        }

        public Builder adres(String val) {
            adres = val;
            return this;
        }

        public Builder city(String val) {
            city = val;
            return this;
        }

        public Builder country(String val) {
            country = val;
            return this;
        }

        public Builder mailSize(int val) {
            mailSize = val;
            return this;
        }

        public User build() {
            return new User(this);
        }
    }
}
