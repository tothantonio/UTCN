public class Circle extends GeometricShape {
    private float radius;

    public Circle(String color, float radius) {
        super(color);
        this.radius = radius;
    }

    public double getArea() {return Math.PI * radius * radius;}
    public double getPerimeter() {return 2 * Math.PI * radius;}
    public double getRadius() {return radius;}
}