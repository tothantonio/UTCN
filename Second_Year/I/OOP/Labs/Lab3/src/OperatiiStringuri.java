public class OperatiiStringuri {
    public static void main(String[] args) {
        String str1 = "Buna";
        String str2 = "Dimineata";
        String str3 = "Hola";

        System.out.println(str1 + " " + str2);

        if(str1 == "Buna"){
            System.out.println(str1 + " " + str1);
        }
        else System.out.println("ERROR");

        if(str1.equals(str3)){
            System.out.println(str1 + " " + str3);
        }
        else System.out.println("ERROR");
    }
}
