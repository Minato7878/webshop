package mygroup.model.entity;

import java.util.Objects;

public class Category {
    private String name;
    private String productId;

    public Category() {
    }

    public Category(String name, String productId) {
        this.name = name;
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Category{" +
                "name='" + name + '\'' +
                ", productId='" + productId + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category category = (Category) o;
        return Objects.equals(name, category.name) &&
                Objects.equals(productId, category.productId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, productId);
    }
}
