import java.util.Scanner;

public class Pasaport extends Document{
	private String judet;
	private String culoareOchi;
	public Pasaport() {
		super();
		Scanner s = new Scanner(System.in);
		System.out.println("Judet: ");
		judet = s.nextLine();
		System.out.println("Culoare ochi: ");
		culoareOchi = s.nextLine();
	}
	
	public String getJudet() {
		return judet;
	}
}
