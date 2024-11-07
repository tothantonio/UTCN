public class Autor {
    private String nume;
    private String prenume;
    private String varsta;

    public Autor(){}

    public Autor(String nume, String prenume, String varsta){
        this.nume = nume;
        this.prenume = prenume;
        this.varsta = varsta;
    }

    public String getNume(){
        return this.nume;
    }

    public String getPrenume(){
        return this.prenume;
    }

    public String getVarsta(){
        return this.varsta;
    }

    public void setNume(String nume){
        this.nume = nume;
    }

    public void setPrenume(String prenume){
        this.prenume = prenume;
    }

    public void setVarsta(String varsta){
        this.varsta = varsta;
    }

    public String toString() {
        return nume + " " + prenume;
    }
}
