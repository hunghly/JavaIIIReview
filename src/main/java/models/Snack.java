package models;

public class Snack {
    private int id;
    private String name;
    private double price;

    public Snack() {};

    public Snack(int id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    public Snack(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
