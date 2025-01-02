package centruSpatial;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;

public class MainGUI {
    public static void main(String[] args) {
        CentruSpatial centru = new CentruSpatial();

        JFrame frame = new JFrame("Centrul Spațial Marte");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(500, 500);

        DefaultListModel<String> listaAeronaveModel = new DefaultListModel<>();
        JList<String> listaAeronave = new JList<>(listaAeronaveModel);
        JScrollPane scrollPane = new JScrollPane(listaAeronave);

        JTextField numeField = new JTextField(10);
        JButton adaugaButton = new JButton("Adaugă Aeronavă");

        adaugaButton.addActionListener(e -> {
            String nume = numeField.getText();
            Apolo apolo = new Apolo(nume, 50000, "Alb", 1969, new ArrayList<>(Arrays.asList("Luna")));
            centru.adaugaAeronava(apolo);
            listaAeronaveModel.addElement(apolo.getNume());
            numeField.setText("");
        });

        JPanel panel = new JPanel();
        panel.add(new JLabel("Nume Aeronavă:"));
        panel.add(numeField);
        panel.add(adaugaButton);

        frame.setLayout(new BorderLayout());
        frame.add(panel, BorderLayout.NORTH);
        frame.add(scrollPane, BorderLayout.CENTER);

        frame.setVisible(true);
    }
}