public class Main {
    public static void main(String[] args) {
        FacebookAccount account1 = new FacebookAccount("Alice", 25, "New York");
        FacebookAccount account2 = new FacebookAccount("Bob", 30, "Los Angeles");
        FacebookAccount account3 = new FacebookAccount("Charlie", 28, "New York");
        FacebookAccount account4 = new FacebookAccount("Georgel", 28, "Barlad");

        account1.addFriend(account4);
        account1.addFriend(account2);
        account1.addFriend(account3);

        System.out.println("Friends of " + account1.getName() + ":");
        for (FacebookAccount friend : account1.getFriends()) {
            System.out.println(friend.getName());
        }

//        System.out.println("Remove Bob from Alice s friends list");
//        account1.removeFriend(account2);
//        for (FacebookAccount friend : account1.getFriends()) {
//            System.out.println(friend.getName());
//        }

        System.out.println("Friends of " + account1.getName() + " from New York:");
        for (FacebookAccount friend : account1.getFriendsFromLocation("New York")) {
            System.out.println(friend.getName());
        }

        System.out.println("Sort friends by name:");
        FacebookAccount.sortByName(account1.getFriends());

        for (FacebookAccount friend : account1.getFriends()) {
            System.out.print(friend.getName() + " ");
        }
    }
}