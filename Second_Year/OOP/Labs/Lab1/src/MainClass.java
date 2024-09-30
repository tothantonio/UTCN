/**
 * Main class of the Java application. 
 * It contains the main method that starts the Java application.
 */
public class MainClass {

	/**
	 * The main method.
	 */
	public static void main(String[] args) {
		Student s1 = new Student("Alex",1998,"UTCN20424");
		Student s2 = new Student();
		Staff x = new Staff("Andrei",1990,"209");
		Student s3 = new Student("Antonio", 2004, "666");
		
		System.out.println(s2.getName());
		
		s2.setName("Andreea");
		s2.setYearOfBirth(1997);
		s2.setSID("UTCN123");
		
		Database d = new Database();
		d.addPerson(s1);
		d.addPerson(s2);
		d.addPerson(x);
		d.addPerson(s3);
		d.listAll();
	}

}
