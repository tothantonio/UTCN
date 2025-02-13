import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class DogTest {
    @Test
    public void testGetName() {
        Dog rex = new Dog("Rex", 5);
        assertEquals(rex.getName(), "Rex");
    }

    @Test
    public void testSetName() {
        Dog rex = new Dog("Rex", 5);
        rex.setName("Max");
        assertEquals(rex.getName(), "Max");
    }
}
