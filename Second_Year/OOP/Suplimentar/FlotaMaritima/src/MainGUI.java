import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainGUI extends JFrame {
    private FlotaMaritima flota;
    private JTextArea displayArea;
    private JTextField nameField, typeField, tonajField, motorField, anFabricatieField, anPlecareField;

    public MainGUI() {
        flota = new FlotaMaritima();
        setTitle("Fleet Management");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Input panel
        JPanel inputPanel = new JPanel(new GridLayout(7, 2));
        inputPanel.add(new JLabel("Name:"));
        nameField = new JTextField();
        inputPanel.add(nameField);

        inputPanel.add(new JLabel("Type (Vapor/Submarine):"));
        typeField = new JTextField();
        inputPanel.add(typeField);

        inputPanel.add(new JLabel("Tonaj:"));
        tonajField = new JTextField();
        inputPanel.add(tonajField);

        inputPanel.add(new JLabel("Motor:"));
        motorField = new JTextField();
        inputPanel.add(motorField);

        inputPanel.add(new JLabel("An Fabricatie:"));
        anFabricatieField = new JTextField();
        inputPanel.add(anFabricatieField);

        inputPanel.add(new JLabel("An Plecare (for Submarine):"));
        anPlecareField = new JTextField();
        inputPanel.add(anPlecareField);

        JButton addButton = new JButton("Add Ship");
        inputPanel.add(addButton);

        JButton displayButton = new JButton("Display Fleet");
        inputPanel.add(displayButton);

        add(inputPanel, BorderLayout.NORTH);

        // Display area
        displayArea = new JTextArea();
        displayArea.setEditable(false);
        add(new JScrollPane(displayArea), BorderLayout.CENTER);

        // Add action listeners
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                addShip();
            }
        });

        displayButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                displayFleet();
            }
        });
    }

    private void addShip() {
        String name = nameField.getText();
        String type = typeField.getText();
        int tonaj = Integer.parseInt(tonajField.getText());
        String motor = motorField.getText();
        int anFabricatie = Integer.parseInt(anFabricatieField.getText());

        if (type.equalsIgnoreCase("Vapor")) {
            flota.adaugaNava(new Vapoare(name, tonaj, motor, anFabricatie, 1000)); // Example value for capacity
        } else if (type.equalsIgnoreCase("Submarine")) {
            int anPlecare = Integer.parseInt(anPlecareField.getText());
            flota.adaugaNava(new Submarine(name, tonaj, motor, anFabricatie, 1000, anPlecare)); // Example value for depth
        }

        clearFields();
    }

    private void displayFleet() {
        displayArea.setText("");
        for (Nava nava : flota.nave) {
            displayArea.append(nava.toString() + "\n");
        }
    }

    private void clearFields() {
        nameField.setText("");
        typeField.setText("");
        tonajField.setText("");
        motorField.setText("");
        anFabricatieField.setText("");
        anPlecareField.setText("");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new MainGUI().setVisible(true);
            }
        });
    }
}