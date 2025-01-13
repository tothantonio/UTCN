import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Main {
    public static void main(String[] args) {
        ArrayList<GeometricShape> shapes = new ArrayList<>();
        shapes.add(new Triangle("Red", 3, 4, 5));
        shapes.add(new Triangle("Blue", 6, 8, 10));
        shapes.add(new Triangle("Magenta", 9, 12, 15));
        shapes.add(new Circle("Green", 5));
        shapes.add(new Circle("Yellow", 7));
        shapes.add(new Circle("Cyan", 9));
        shapes.add(new Square("Purple", 4));
        shapes.add(new Square("Orange", 1));
        shapes.add(new Square("Pink", 8));

        try{
            checkTriangleInSquare((Triangle) shapes.get(0), (Square) shapes.get(7));
            // triunghiul rosu cu patratul portocaliu
        } catch (InclusionNotPossibleException e) {
            System.out.println(e.getMessage());
        }

        sortByArea(shapes);

        System.out.println("\nFormele sortate dupa aria lor:\n");
        for (GeometricShape shape : shapes) {
            //cu doua zecimale
            System.out.println(shape.getClass().getSimpleName() + " Area: " + String.format("%.2f", shape.getArea()) + " Color: " + shape.getColor());
        }
    }

    public static void sortByArea(ArrayList<GeometricShape> shapes) {
        Collections.sort(shapes, Comparator.comparingDouble(GeometricShape::getArea));
    }

    public static void checkTriangleInSquare(Triangle triangle, Square square) throws InclusionNotPossibleException {
        if (triangle.getBase() <= square.getSide() && triangle.getHeight() <= square.getSide()) {
            System.out.println("\nTriangle can fit in the square.");
        } else {
            throw new InclusionNotPossibleException("\nTriangle cannot fit in the square.");
        }
    }
}