package mygroup.model.dto;

import mygroup.model.entity.Order;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CartDTO {
    private double totalPrice;
    private int itemsCount;
    private List<Order> cart;

    public CartDTO() {
        this.totalPrice = 0;
        this.itemsCount = 0;
        this.cart = new ArrayList<>();
    }

    public List<Order> getCart() {
        return cart;
    }

    public void addOrder(Order order) {
        cart.add(order);
        totalPrice += order.getProduct().getPrice()*order.getQuantity();
        System.out.println(totalPrice);
        itemsCount++;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getItemsCount() {
        return itemsCount;
    }

    public void setItemsCount(int itemsCount) {
        this.itemsCount = itemsCount;
    }

    @Override
    public String toString() {
        return "CartDTO{" +
                "totalPrice=" + totalPrice +
                ", itemsCount=" + itemsCount +
                ", cart=" + cart +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartDTO cartDTO = (CartDTO) o;
        return Double.compare(cartDTO.totalPrice, totalPrice) == 0 &&
                itemsCount == cartDTO.itemsCount &&
                Objects.equals(cart, cartDTO.cart);
    }

    @Override
    public int hashCode() {
        return Objects.hash(totalPrice, itemsCount, cart);
    }
}
