public class Square extends GeometricShape {
    private float side;

    public Square(String color, float side) {
        super(color);
        this.side = side;
    }

    public double getArea() {return side * side;}
    public double getPerimeter() {return 4 * side;}
    public double getSide() {return side;}
}
