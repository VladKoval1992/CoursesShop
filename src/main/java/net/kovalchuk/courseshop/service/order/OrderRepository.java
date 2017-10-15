package net.kovalchuk.courseshop.service.order;

import net.kovalchuk.courseshop.entity.Order;
import net.kovalchuk.courseshop.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    @Query("SELECT c FROM Order c WHERE c.user = :user")
    List<Order> findOrderByUser(@Param("user") User user);

}
