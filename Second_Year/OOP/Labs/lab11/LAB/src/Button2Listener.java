import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class Button2Listener implements ActionListener {
    private JTextField textField;
    private JLabel label;

    public Button2Listener(JTextField textField, JLabel label) {
        this.textField = textField;
        this.label = label;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String text = textField.getText();
        label.setText(text);
    }
}