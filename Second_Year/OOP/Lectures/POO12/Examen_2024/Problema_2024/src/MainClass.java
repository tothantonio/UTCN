
public class MainClass {

	public static void main(String[] args) {
		Aeronava a = new Aeronava(30,6);
		Persoana p1 = new Persoana();
		Persoana p2 = new Persoana();
		
		try {
			a.imbarca(p1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			a.imbarca(p2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Nr persoane cu pasaport de Cluj : "+ a.nrPersoanePasaportCluj());
		a.afisarePersoane();
	}

}
