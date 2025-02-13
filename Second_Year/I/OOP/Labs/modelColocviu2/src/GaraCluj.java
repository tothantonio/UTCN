import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

public class GaraCluj {
    private List<Tren> trenuri;

    public GaraCluj(List<Tren> trenuri) {
        this.trenuri = trenuri;
        JFrame frame = new JFrame("Selectie Destinatie");
        JComboBox<String> destinatiiComboBox = new JComboBox<>(new String[]{"Bucuresti", "Constanta", "Timisoara"});
        JTextArea rezultatTextArea = new JTextArea(10, 30);
        JButton afiseazaButton = new JButton("Afiseaza Trenuri");

        afiseazaButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String destinatieSelectata = (String) destinatiiComboBox.getSelectedItem();
                StringBuilder rezultat = new StringBuilder();
                for (Tren tren : trenuri) {
                    if (tren.getDestinatie().equals(destinatieSelectata)) {
                        rezultat.append(tren.getNume()).append("\n");
                    }
                }
                rezultatTextArea.setText(rezultat.toString());
            }
        });

        frame.setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.Y_AXIS));
        frame.add(destinatiiComboBox);
        frame.add(afiseazaButton);
        frame.add(new JScrollPane(rezultatTextArea));
        frame.pack();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        List<Tren> trenuri = new ArrayList<>();
        trenuri.add(new TrenPasageri("Tren1", 200, 2010, 120, "Cluj", "Bucuresti", 50, 150));
        trenuri.add(new TrenMarfa("Tren2", 500, 2015, 80, "Cluj", "Constanta", "Carbune"));
        trenuri.add(new TrenPasageri("Tren3", 300, 2012, 100, "Cluj", "Timisoara", 100, 200));

        new GaraCluj(trenuri);
    }
}