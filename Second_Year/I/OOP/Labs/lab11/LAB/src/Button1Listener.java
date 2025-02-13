import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JLabel;

public class Button1Listener implements ActionListener {
    private int clickCount = 0;
    private JLabel label;
    private String text;

    public Button1Listener(JLabel label, JLabel text) {
        this.text = String.valueOf(text);
        this.label = label;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        clickCount++;
        text = label.getText();
        label.setText("Button 1 clicked " + clickCount + " times");

    }
}