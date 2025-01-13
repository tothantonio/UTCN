public abstract class GeometricShape {
    private String color;

    public GeometricShape(String color) {
        this.color = color;
    }

    public abstract double getArea();
    public abstract double getPerimeter();
    public String getColor() {return color;}
}