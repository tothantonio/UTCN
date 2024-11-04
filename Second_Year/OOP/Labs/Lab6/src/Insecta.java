public class Insecta
{
    private int i = 9;
    protected int j;
    Insecta()
    {
        System.out.println("i = " + i + ", j = " + j);
        j = 39;
    }
    private static int x1 = printInit("static Insecta.x1 initializata");
    static int printInit(String s)
    {
        System.out.println(s);
        return 47;
    }
}
