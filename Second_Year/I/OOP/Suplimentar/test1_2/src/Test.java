public class Test {
    public static void main(String[] args) {
        Angajat [] x = new Angajat[2];
        System.out.println("S-a alocat un tablou cu "+x.length+" angajati!");

        x[0] = new Angajat();
        x[1] = new Angajat("alin", 1994);
        byte e = x[0].getAniExperienta();
        x[1].setAniExperienta(e+3.0);
        new Angajat();
        new Angajat();
        for(Angajat a: x){
            System.out.println(a.detaliiAngajat());
        }
        System.out.println("S-au creat "+Angajat.ANGAJATI+" angajati ai companiei "+Angajat.getCompanie());
    }
}
