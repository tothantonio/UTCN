public class Persoana {
    private String nume;
    private short anulNasterii;
    private String[] limbiStraine;
    static final String TARA = "Romania";
    static final int NR_MAXIM_LIMBI = 10;

    public Persoana(String nume, int anulNasterii){
        this.nume = nume;
        this.anulNasterii = (short)anulNasterii;
        limbiStraine = new String[NR_MAXIM_LIMBI];
    }

    public Persoana(){
        this("Ioana", 2000);
        limbiStraine = new String[]{"engleza"};
    }

    public void invataLimba(String limba){
        int i = 0;
        while(i < limbiStraine.length && limbiStraine[i] != null){
            i++;
        }
        if(i < limbiStraine.length){
            limbiStraine[i] = limba;
        }
    }
    public String[] getLimbiStraine(){
        return limbiStraine;
    }
    public String detalii(){
        String r = nume+", nascut(a) in anul "+anulNasterii+", cunoaste urmatoarele limbi straine: ";
        for(String limba : limbiStraine){
            if(limba != null){
                r += limba + " ";
            }
        }
        return r;
    }
}
