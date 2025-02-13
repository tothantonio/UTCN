public class Ghiozdan {
    Rechizita[] rechizite = new Rechizita[10];
    private int contor = 0;

    public void addManual(Rechizita r) {
        rechizite[contor] = r;
        contor++;
    }

    public void listItems() {
        for(int i = 0; i < contor; i++){
            System.out.println(rechizite[i].getNume());
        }
    }

    public void listManual(){
        for(int i = 0; i < contor; i++){
            if(rechizite[i] instanceof Manual){
                System.out.println(rechizite[i].getNume());
            }
        }
    }

    public void listCaiet(){
        for(int i = 0; i < contor; i++){
            if(rechizite[i] instanceof Caiet){
                System.out.println(rechizite[i].getNume());
            }
        }
    }

    public int getNrRechizite(){
        return contor;
    }

    public void getNrCaiet(){
        int nr = 0;
        for(int i = 0; i < contor; i++){
            if(rechizite[i] instanceof Caiet){
                nr++;
            }
        }
        System.out.println(nr);
    }

    public void getNrManual(){
        int nr = 0;
        for(int i = 0; i < contor; i++){
            if(rechizite[i] instanceof Manual){
                nr++;
            }
        }
        System.out.println(nr);
    }
}
