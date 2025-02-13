import java.util.HashMap;
public class PetHotel {
    private HashMap<String, Dog> dogs;

    public PetHotel() {
        this.dogs = new HashMap<>();
    }

    public void addDog(String id, Dog dog) {
        dogs.put(id, dog);
    }

    public void removeDog(String id) {
        dogs.remove(id);
    }

    public Dog getDog(String id) {
        return dogs.get(id);
    }

    public HashMap<String, Dog> getAllDogs() {
        return new HashMap<>(dogs);
    }
}