import javax.swing.*;

public class MainGUI {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Triangle Area Calculator");
        frame.setSize(400, 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JPanel panel = new JPanel();
        frame.add(panel);
        placeComponents(panel);
        frame.setVisible(true);
    }

    public static void placeComponents(JPanel panel) {
        panel.setLayout(null);

        JLabel baseLabel = new JLabel("Base:");
        baseLabel.setBounds(10, 20, 80, 25);
        panel.add(baseLabel);

        JTextField baseText = new JTextField(20);
        baseText.setBounds(100, 20, 165, 25);
        panel.add(baseText);

        JLabel heightLabel = new JLabel("Height:");
        heightLabel.setBounds(10, 50, 80, 25);
        panel.add(heightLabel);

        JTextField heightText = new JTextField(20);
        heightText.setBounds(100, 50, 165, 25);
        panel.add(heightText);

        JButton calculateButton = new JButton("Calculate");
        calculateButton.setBounds(10, 80, 100, 25);
        panel.add(calculateButton);

        JLabel resultLabel = new JLabel("Area:");
        resultLabel.setBounds(10, 110, 80, 25);
        panel.add(resultLabel);

        JLabel areaLabel = new JLabel("");
        areaLabel.setBounds(100, 110, 165, 25);
        panel.add(areaLabel);

        calculateButton.addActionListener(e -> {
            float base = Float.parseFloat(baseText.getText());
            float height = Float.parseFloat(heightText.getText());
            double area = (base * height) / 2;
            areaLabel.setText(String.valueOf(area));
        });
    }
}
