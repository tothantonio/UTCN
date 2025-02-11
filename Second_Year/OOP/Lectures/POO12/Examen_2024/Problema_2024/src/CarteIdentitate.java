import java.util.Scanner;

public class CarteIdentitate extends Document{
	private String adresa;
	public CarteIdentitate() {
		super();
		Scanner s = new Scanner(System.in);
		System.out.println("Adresa: ");
		adresa = s.nextLine();
	}
}
