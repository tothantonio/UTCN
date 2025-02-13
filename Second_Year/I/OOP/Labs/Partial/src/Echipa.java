class Echipa {
    private String nume;
    private TeamLeader teamLeader;
    private Developer[] developeri;
    private int nrDeveloperi = 0;

    public Echipa(String nume, TeamLeader teamLeader, int maxDeveloperi) {
        this.nume = nume;
        this.teamLeader = teamLeader;
        this.developeri = new Developer[maxDeveloperi];
    }

    public void adaugaDeveloper(Developer developer) {
        if (nrDeveloperi < developeri.length) {
            developeri[nrDeveloperi++] = developer;
        }
    }

    public int getTotalTaskuriRezolvate() {
        int total = 0;
        for (int i = 0; i < nrDeveloperi; i++) {
            total += developeri[i].getNrTaskuriRezolvate();
        }
        return total;
    }

    public double getCostTotalEchipa(int nrOreLucrate) {
        double cost = teamLeader.calculeazaSalariu(nrOreLucrate);
        for (int i = 0; i < nrDeveloperi; i++) {
            cost += developeri[i].calculeazaSalariu(nrOreLucrate);
        }
        return cost;
    }

    public String getNume() {
        return nume;
    }

    public TeamLeader getTeamLeader() {
        return teamLeader;
    }
}