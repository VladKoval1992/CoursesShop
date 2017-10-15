package net.kovalchuk.courseshop.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="ORDERS")
public class Order {

    @Id
    @GeneratedValue
    private long id;

    private long numberOrder;
    private int priceOrder;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "ORDER_COURSES",  joinColumns = {
            @JoinColumn(name = "COURSE_ID") },
            inverseJoinColumns = { @JoinColumn(name = "ORDER_ID")})
    private List<Courses> courses;



    @ManyToOne
    @JoinColumn(name="USER_ID")
    private User user;


    public Order(){}


    public Order(User user, long numberOrder, int priceOrder, List<Courses> order){
        this.user = user;
        this.numberOrder = numberOrder;
        this.priceOrder = priceOrder;
        this.courses = order;

    }

    public Order(User user, long numberOrder){
        this.numberOrder = numberOrder;
        this.user = user;
    }



    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getNumberOrder() {
        return numberOrder;
    }

    public void setNumberOrder(int numberOrder) {
        this.numberOrder = numberOrder;
    }

    public List<Courses> getCourses() {
        return courses;
    }

    public void setCourses(List<Courses> courses) {
        this.courses = courses;
    }

    public int getPriceOrder() {
        return priceOrder;
    }

    public void setPriceOrder(int priceOrder) {
        this.priceOrder = priceOrder;
    }
}
