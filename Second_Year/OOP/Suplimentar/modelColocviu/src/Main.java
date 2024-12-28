import centruSpatial.Om;
import centruSpatial.Robot;

public class Main {
    public static void main(String[] args) {
        Om om = new Om("Ion");
        Robot robot = new Robot("R2D2");

        om.lucreaza();
        om.pauza();
        om.mananca();
        om.doarme();

        robot.lucreaza();
        robot.pauza();

    }
}