import java.util.Scanner;

public class Bilet {
	private int rand, coloana;
	
	public Bilet() 
	{
		Scanner s = new Scanner(System.in);
		System.out.println("Rand: ");
		rand = s.nextInt();
		System.out.println("Coloana: ");
		coloana = s.nextInt();
	}

	public int getRand() {
		return rand;
	}
	public int getColoana() {
		return coloana;
	}
}
