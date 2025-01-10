public class B extends A{
    protected int t = 20;

    public B() {
        x += "B";
        t+=2;
    }

    public String method() {
        return "B:"+t;
    }
}
