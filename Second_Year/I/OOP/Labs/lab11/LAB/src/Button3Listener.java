import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;
import javax.swing.JPanel;

public class Button3Listener implements ActionListener {
    private JPanel panel1;
    private JPanel panel2;

    public Button3Listener(JPanel panel1, JPanel panel2) {
        this.panel1 = panel1;
        this.panel2 = panel2;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        Random rand = new Random();
        panel1.setBackground(new Color(rand.nextInt(256), rand.nextInt(256), rand.nextInt(256)));
        panel2.setBackground(new Color(rand.nextInt(256), rand.nextInt(256), rand.nextInt(256)));
    }
}