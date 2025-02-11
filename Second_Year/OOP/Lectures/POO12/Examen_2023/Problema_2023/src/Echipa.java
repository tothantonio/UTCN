import java.util.Scanner;

public class Echipa implements Comparable<Echipa> {
	private String nume;
	private int anul;
	
	public Echipa() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nume=");
		nume=scanner.nextLine();
		System.out.println("Anul infiintarii=");
		anul=scanner.nextInt();
	}

	@Override
	public int compareTo(Echipa o) {
		return this.nume.compareTo(o.nume);
	}
	public String getNume() {
		return nume;
	}
	
}
