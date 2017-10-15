package net.kovalchuk.courseshop.service.order;


import net.kovalchuk.courseshop.entity.Order;
import net.kovalchuk.courseshop.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderServicce {
    @Autowired
    private OrderRepository orderRepository;

    @Override
    @Transactional
    public void addOrder(Order order) {
        orderRepository.save(order);
    }

    @Transactional(readOnly = true)
    public List<Order> getAllOrder(User user) {
        return orderRepository.findOrderByUser(user);
    }


    @Override
    @Transactional
    public void deleteOrder(long id[]) {
        for (long i : id) {
            orderRepository.delete(i);
        }
    }
}
