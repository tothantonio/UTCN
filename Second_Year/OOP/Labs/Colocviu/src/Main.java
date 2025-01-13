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

        try{
            checkTriangleInSquare((Triangle) shapes.get(1), (Square) shapes.get(8));
            //triunghiul albastru cu patratul roz
        } catch(InclusionNotPossibleException e){
            System.out.println(e.getMessage());
        }

        sortByArea(shapes);

        System.out.println("\nFormele sortate dupa aria lor:\n");
        for (GeometricShape shape : shapes) {
            //cu doua zecimale
            System.out.println(shape.getColor() + " " + shape.getClass().getSimpleName() + " Area: " + String.format("%.2f", shape.getArea()));
        }
    }
    /*
    *   Red Triangle cannot fit in the Orange Square.

        Blue Triangle can fit in the PinkSquare.

        Formele sortate dupa aria lor:

        Orange Square Area: 1,00
        Red Triangle Area: 6,00
        Purple Square Area: 16,00
        Blue Triangle Area: 24,00
        Magenta Triangle Area: 54,00
        Pink Square Area: 64,00
        Green Circle Area: 78,54
        Yellow Circle Area: 153,94
        Cyan Circle Area: 254,47
     */

    public static void sortByArea(ArrayList<GeometricShape> shapes) {
        Collections.sort(shapes, Comparator.comparingDouble(GeometricShape::getArea));
    }

    public static void checkTriangleInSquare(Triangle triangle, Square square) throws InclusionNotPossibleException {
        if (triangle.getBase() <= square.getSide() && triangle.getHeight() <= square.getSide()) {
            System.out.println("\n" + triangle.getColor() + " Triangle can fit in the " + square.getColor() +  "Square.");
        } else {
            throw new InclusionNotPossibleException("\n" + triangle.getColor() + " Triangle cannot fit in the " + square.getColor() +  " Square.");
        }
    }
}