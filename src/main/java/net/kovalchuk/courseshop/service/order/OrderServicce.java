package net.kovalchuk.courseshop.service.order;


import net.kovalchuk.courseshop.entity.Order;
import net.kovalchuk.courseshop.entity.User;

import java.util.List;


public interface OrderServicce {
    void addOrder(Order order);
    List<Order> getAllOrder(User user);
    void deleteOrder(long id[]);


}
