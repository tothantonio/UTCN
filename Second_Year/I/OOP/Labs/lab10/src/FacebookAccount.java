import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FacebookAccount implements Comparable{
    public String name;
    public int age;
    public String current_location;
    public List<FacebookAccount> friends;

    public FacebookAccount(String name, int age, String current_location) {
        this.name = name;
        this.age = age;
        this.current_location = current_location;
        this.friends = new ArrayList<>();
    }

    public void addFriend(FacebookAccount friend) {
        if (!friends.contains(friend)) {
            friends.add(friend);
        }
    }
    public void removeFriend(FacebookAccount friend) {
        for(int i = 0; i < friends.size(); i++) {
            if (friends.get(i).equals(friend)) {
                friends.remove(i);
                break;
            }
        }
    }

    public List<FacebookAccount> getFriendsFromLocation(String location) {
        List<FacebookAccount> friendsFromLocation = new ArrayList<>();
        for (FacebookAccount friend : friends) {
            if (friend.getCurrentLocation().equals(location)) {
                friendsFromLocation.add(friend);
            }
        }
        return friendsFromLocation;
    }

    public int compareTo(Object o) {
        FacebookAccount other = (FacebookAccount) o;
        return this.name.compareTo(other.name);
    }

    public static void sortByName(List<FacebookAccount> accounts) {
        Collections.sort(accounts);
    }

    public static void sortByNameDesc(List<FacebookAccount> accounts) {
        Collections.sort(accounts, Collections.reverseOrder());
    }

    public List<FacebookAccount> getFriends() {return friends;}
    public String getName() {return name;}
    public int getAge() {return age;}
    public String getCurrentLocation() {return current_location;}

    public void setCurrentLocation(String location) {current_location = location;}

    public String toString() {
        return name + " " + age + " " + current_location;
    }
}
