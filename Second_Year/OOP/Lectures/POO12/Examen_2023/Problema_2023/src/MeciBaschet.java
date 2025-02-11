import java.util.Date;

public class MeciBaschet extends Meci{

	private int[] p1Sfert;
	private int[] p2Sfert;

	public MeciBaschet(Date data, Echipa echipa1, Echipa echipa2, int p1, int p2, int[] p1Sfert, int[] p2Sfert) throws Exception {
		super(data, echipa1, echipa2, p1, p2);
		for (int x: p1Sfert)
			if (x<0)
				throw new Exception("Scor negativ!");
		for (int x: p2Sfert)
			if (x<0)
				throw new Exception("Scor negativ!");
		
		this.p1Sfert = p1Sfert;
		this.p2Sfert = p2Sfert;
	}
	
}
