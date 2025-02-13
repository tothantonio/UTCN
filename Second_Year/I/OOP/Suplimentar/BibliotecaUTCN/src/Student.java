public class Student extends Persoana{
    public Student(int id, String nume, int maxCarti){
        super(id,nume, maxCarti);
    }

    public String toString(){
        return "Student [id = " + id + ", nume = " + nume + "]";
    }
}
