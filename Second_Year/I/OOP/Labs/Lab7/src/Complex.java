public class Complex implements Numeric {
    private double real;
    private double imag;

    public Complex(double real, double img) {
        this.real = real;
        this.imag = img;
    }

    public void setReal(double real) {
        this.real = real;
    }

    public void setImag(double imag) {
        this.imag = imag;
    }

    public double getReal() {
        return this.real;
    }

    public double getImag() {
        return this.imag;
    }

    public Numeric add(Numeric n) {
        if(n instanceof Complex) {
            Complex c = (Complex) n;
            Complex result = new Complex(0, 0);
            result.real = this.real + c.real;
            result.imag = this.imag + c.imag;
            return result;
        } else {
            Fractie c = (Fractie) n;
            Complex result = new Complex(0,0);
            result.real = c.getFractie() + this.real;
            result.imag = this.imag;
            return result;
        }
    }

    public Numeric subtract(Numeric n) {
        if(n instanceof Complex) {
            Complex c = (Complex) n;
            Complex result = new Complex(0, 0);
            result.real = this.real - c.real;
            result.imag = this.imag - c.imag;
            return result;
        } else {
            Fractie c = (Fractie) n;
            Complex result = new Complex(0,0);
            result.real = this.real - c.getFractie();
            result.imag = this.imag;
            return result;
        }
    }

    public Numeric multiply(Numeric n) {
        if(n instanceof Complex) {
            Complex c = (Complex) n;
            Complex result = new Complex(0, 0);
            result.real = this.real * c.real - this.imag * c.imag;
            result.imag = this.real * c.imag + this.imag * c.real;
            return result;
        } else {
            Fractie c = (Fractie) n;
            Complex result = new Complex(0,0);
            result.real = c.getFractie() * this.real;
            result.imag = c.getFractie() * this.imag;
            return result;
        }
    }

    public String toString() {
        String num = "Complex " + this.real;
        if(this.imag > 0) {
            num += " + ";
            num += this.imag;
        } else {
            num += " - ";
            num += -this.imag;
        }
        return num;
    }
}
