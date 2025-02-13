import java.util.Date;

public class MeciFotbal extends Meci{

	private int p1Pauza, p2Pauza;
	
	public MeciFotbal(Date data, Echipa echipa1, Echipa echipa2, int p1, int p2, int p1Pauza, int p2Pauza) throws Exception{
		super(data, echipa1, echipa2, p1, p2);
		if (p1Pauza<0 || p2Pauza<0)
			throw new Exception("Scor negativ!");
		this.p1Pauza = p1Pauza;
		this.p2Pauza = p2Pauza;
	}
}
