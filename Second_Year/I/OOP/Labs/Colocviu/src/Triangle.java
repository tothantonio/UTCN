public class Triangle extends GeometricShape {
    private float height;
    private float base;
    private float side;

    public Triangle(String color, float height, float base, float side) {
        super(color);
        this.height = height;
        this.base = base;
        this.side = side;
    }

    public double getArea() {return (base * height) / 2;}
    public double getPerimeter() {return 2 * side + base;}
    public double getBase() {return base;}
    public double getHeight() {return height;}
}