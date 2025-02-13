public class Main{
    public static void main(String[] args) {
        TablaSah tabla = new TablaSah();
        tabla.afisareTabla();

        System.out.println("Mutare pion negru de la (6, 0) la (4, 0): " + tabla.mutarePiesa(0, 6, 0, 4));
        tabla.afisareTabla();
    }
}