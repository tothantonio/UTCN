import java.util.Date;

public abstract class Meci implements Comparable<Meci>{	
	private Date data;
	private Echipa echipa1;
	private Echipa echipa2;
	private int p1;
	private int p2;
	
	public Meci(Date data, Echipa echipa1, Echipa echipa2, int p1, int p2) throws Exception {
		super();
		this.data = data;
		this.echipa1 = echipa1;
		this.echipa2 = echipa2;
		if (p1<0 || p2<0)
			throw new Exception("Scor negativ!");
		
		this.p1 = p1;
		this.p2 = p2;
	}
	
	public int compareTo(Meci x)
	{
		return data.compareTo(x.data);
	}
	
	public String toString() {
		return this.getClass().getName()+" data: "+data+" "+echipa1.getNume()+"-"+echipa2.getNume()+" "+p1+"-"+p2;
	}
	
	public int getP1() {
		return p1;
	}
	public int getP2() {
		return p2;
	}
	public Echipa getEchipa1() {
		return echipa1;
	}
	public Echipa getEchipa2() {
		return echipa2;
	}
}
