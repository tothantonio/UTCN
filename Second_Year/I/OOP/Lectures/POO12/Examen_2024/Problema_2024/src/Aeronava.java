import java.util.ArrayList;
import java.util.Collections;

public class Aeronava {
	private Persoana[][] pasageri;
	private int randuri;
	private int coloane;
	
	public Aeronava(int randuri, int coloane) {
		pasageri = new Persoana[randuri][coloane];
		this.randuri = randuri;
		this.coloane = coloane;
	}
	
	public void imbarca(Persoana p) throws Exception {
		int r = p.getBilet().getRand();
		int c = p.getBilet().getColoana();
		if (pasageri[r][c]!=null)
			throw new Exception("loc ocupat!");
		else
			pasageri[r][c]=p;
	}
	
	public int nrPersoanePasaportCluj() {
		int contor=0;
		for (int r=0; r<randuri; r++)
			for (Persoana p: pasageri[r])
				if (p!=null && p.getDocument() instanceof Pasaport)
				{
					Pasaport d = (Pasaport)p.getDocument();
					if (d.getJudet().equals("Cluj"))
						contor++;
				}
		return contor;
	}
	
	public void afisarePersoane() {
		ArrayList<Persoana> a  = new ArrayList();
		for (int r=0; r<randuri; r++)
			for (Persoana p: pasageri[r])
				if (p!=null)
					a.add(p);
		Collections.sort(a);
		for (Persoana p: a)
			System.out.println(p);
	}
}
