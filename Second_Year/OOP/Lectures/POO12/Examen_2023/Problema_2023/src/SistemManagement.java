import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeSet;

public class SistemManagement {
	private TreeSet<Echipa> echipe = new TreeSet<Echipa>();
	private LinkedList<Meci> meciuri = new LinkedList<Meci>();
	
	public void add(Echipa e) {
		echipe.add(e);
	}
	public void add(Meci m) {
		meciuri.add(m);
	}
	
	public void infoMeciuri()
	{
		Collections.sort(meciuri);
		System.out.println("Meciurile in ordine cronologica: ");
		for (Meci m : meciuri)
			System.out.println(m);
	}
	
	public void echipeMeciuriFotbalCastigateMaxime() {
		Map<Echipa,Integer> echipeVictorii = new HashMap<>();
		int maxim = 0;
		for (Meci m : meciuri)
			if (m instanceof MeciFotbal)
			{
				if (m.getP1()>m.getP2())
				{
					int x=0;
					if (echipeVictorii.containsKey(m.getEchipa1()))
						x = echipeVictorii.get(m.getEchipa1());

					x++;
					
					echipeVictorii.put(m.getEchipa1(), x);
					if (x>maxim)
						maxim = x;
				} else
				{
					if (m.getP2()>m.getP1())
					{
						int x=0;
						if (echipeVictorii.containsKey(m.getEchipa2()))
							x = echipeVictorii.get(m.getEchipa2());
						
						x++;
						echipeVictorii.put(m.getEchipa2(), x);
						if (x>maxim)
							maxim = x;						
					}
				}
			}
		
		System.out.println("Echipe cu numar maxim de meciuri de fotbal castigate: ");
		for (Entry<Echipa,Integer> e : echipeVictorii.entrySet())
		{
			if (e.getValue() == maxim)
				System.out.print(e.getKey().getNume()+" ");
		}
	}
	
	public static void main(String[] args) {
		SistemManagement s = new SistemManagement();
		
		Echipa e1 = new Echipa();
		Echipa e2 = new Echipa();
		Echipa e3 = new Echipa();
		Echipa e4 = new Echipa();
		Echipa e5 = new Echipa();		
		
		s.add(e1);
		s.add(e2);
		s.add(e3);
		s.add(e4);
		s.add(e5);
		
		try {
			Meci m1 = new MeciFotbal(new Date(123,10,15),e1,e2,3,1,0,1);
			s.add(m1);
			Meci m2 = new MeciFotbal(new Date(123,9,7),e2,e3,1,2,1,1);
			s.add(m2);
			Meci m3 = new MeciFotbal(new Date(122,5,17),e3,e2,4,2,4,1);	
			s.add(m3);
			Meci m4 = new MeciBaschet(new Date(121,7,6),e4,e5,85,80, new int[] {12,18,30,25}, new int[] {15,15,15,5});
			s.add(m4);
		} catch (Exception e) 
		{
			System.out.println("Exceptie - creare meci!");
		}
		
		s.infoMeciuri();
		s.echipeMeciuriFotbalCastigateMaxime();
		
	}
}
