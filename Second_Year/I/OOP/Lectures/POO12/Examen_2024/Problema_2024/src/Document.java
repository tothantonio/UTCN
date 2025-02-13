import java.util.Scanner;

public class Document {
	private String nume;
	private String CNP;
	
	public Document() {
		Scanner s = new Scanner(System.in);
		System.out.println("Numele: ");
		nume = s.nextLine();
		System.out.println("CNP: ");
		CNP = s.nextLine();
	}
	
	public String getNume() {
		return nume;
	}
}
