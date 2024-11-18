public class Fractie implements Numeric{
    double fractie;

    public Fractie(double fractie) {
        this.fractie = fractie;
    }

    double getFractie() {
        return this.fractie;
    }

    public Numeric add(Numeric n) {
        if(n instanceof Complex) {
            Complex c = (Complex) n;
            Complex result = new Complex(0, 0);
            //use setReal and setImag
            result.setReal(this.fractie + c.getReal());
            result.setImag(c.getImag());
            return result;
        } else {
            Fractie c = (Fractie) n;
            Fractie result = new Fractie(0);
            result.fractie = this.fractie + c.fractie;
            return result;
        }
    }

    public Numeric subtract(Numeric n) {
        if(n instanceof Complex) {
            Complex c = (Complex) n;
            Complex result = new Complex(0, 0);
            result.setReal(this.fractie - c.getReal());
            result.setImag(c.getImag());
            return result;
        } else {
            Fractie c = (Fractie) n;
            Fractie result = new Fractie(0);
            result.fractie = this.fractie - c.fractie;
            return result;
        }
    }

    public Numeric multiply(Numeric n) {
        if(n instanceof Complex) {
            Complex c = (Complex) n;
            Complex result = new Complex(0, 0);
            result.setReal(this.fractie * c.getReal());
            result.setImag(this.fractie * c.getImag());
            return result;
        } else {
            Fractie c = (Fractie) n;
            Fractie result = new Fractie(0);
            result.fractie = this.fractie * c.fractie;
            return result;
        }
    }

    public String toString() {
        return "Fractia: " + this.fractie;
    }
}
