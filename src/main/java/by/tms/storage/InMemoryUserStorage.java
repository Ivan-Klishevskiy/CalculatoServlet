package by.tms.storage;

import by.tms.entity.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class InMemoryUserStorage {

    private final static InMemoryUserStorage instance = new InMemoryUserStorage();

    private List<User> userList = new ArrayList<>();

    public static InMemoryUserStorage getInstance() {
        return instance;
    }

    public void saveUser(User user) {
        userList.add(user);
    }

    public User findByUsername(String username) {
        for (User user : userList) {
            if (user.getUsername().equals(username)) {
                return user;
            }
        }
        return null;
    }

    public void updateUser(String username, String newName, String newPassword) {
        for (User temp : userList) {
            if (Objects.equals(temp.getUsername(), username)) {
                temp.setName(newName);
                temp.setPassword(newPassword);
                break;
            }
        }

    }

    public void deleteUser(String username, String password) {
        userList.removeIf(user -> username == user.getUsername() && password == user.getPassword());

    }
}

