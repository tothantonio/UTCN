public class Complex {
    private int re, im;

    public Complex(){
        this.re = 0;
        this.im = 0;
    }

    public Complex(int re, int im){
        this.re = re;
        this.im = im;
    }

    public void adunare(Complex c){
        this.re += c.re;
        this.im += c.im;
    }

    public void scadere(Complex c){
        this.re -= c.re;
        this.im -= c.im;
    }

    public void inmultireScalar(Complex c){
        this.re *= c.re;
        this.im *= c.im;
    }

    public void inmultire(Complex c){
        this.re = (this.re * c.re) + this.im * (-1) * c.im;
        this.im = this.re * c.im + this.im * c.re;
    }

    public String toString(){
        if (this.im == 0)
            return this.re + "";
        else if (this.re == 0)
            return this.im + "i";
        else if(this.im < 0)
            return this.re + " - " + -this.im + "i";
        else
            return this.re + " + " + this.im + "i";

    }
}
