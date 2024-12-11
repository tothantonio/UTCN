import java.util.Arrays;

public class MainClass {
    public static void main(String[] args) {
        ContBancar[] conturi = new ContBancar[3];
        conturi[0]=new ContCurent("Popescu Andrei");
        conturi[1]=new ContEconomii("Ionescu Alex", 20);
        conturi[2]=new ContCurent("Pop Ioana");
        conturi[0].depune(200);
        conturi[1].depune(900);
        ((ContEconomii)conturi[1]).acordaDobanda();
        conturi[2].depune(1000);
        try{
            conturi[2].retrage(1500);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

        Arrays.sort(conturi);
        System.out.println(Arrays.toString(conturi));
    }
}
