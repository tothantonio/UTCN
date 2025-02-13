import java.util.Scanner;

public class Persoana implements Comparable<Persoana>{
	private Bilet bilet;
	private Document document;
	
	public Persoana() {
		Scanner s = new Scanner(System.in);
		System.out.println("Cu ce calatoreste? (P = Pasaport, altceva = CI) ");
		String tip = s.nextLine();
		if (tip.equals("P"))
			document = new Pasaport();
		else
			document = new CarteIdentitate();
		
		bilet = new Bilet();
	}

	public Bilet getBilet() {
		return bilet;
	}
	public Document getDocument() {
		return document;
	}
	public String toString() {
		return document.getNume() + " ("+bilet.getRand()+", "+ bilet.getColoana()+")";
	}
	public int compareTo(Persoana o) {
		return document.getNume().compareTo(o.getDocument().getNume());
	}
	
	
}
