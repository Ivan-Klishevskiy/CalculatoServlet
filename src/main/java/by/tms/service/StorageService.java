package by.tms.service;

import by.tms.entity.User;
import by.tms.storage.InMemoryUserStorage;
import by.tms.storage.jdbc.repository.JdbcOperationRepository;
import by.tms.storage.jdbc.repository.JdbcUserRepository;

import java.util.List;

public class StorageService {
    private final static StorageService instance = new StorageService();

    private final InMemoryUserStorage memoryUserStorage = InMemoryUserStorage.getInstance();

    private final JdbcUserRepository jdbcUserStorage =new JdbcUserRepository();

    private final JdbcOperationRepository jdbcOperationStorage = new JdbcOperationRepository();

    public static StorageService getInstance(){
        return instance;
    }

    public List<User> findAllUsers(){
        return jdbcUserStorage.findAllUsers();
    }

    public User findByUsername(String username){
        return jdbcUserStorage.findByUsername(username);
    }

    public boolean saveUser(User user){
        if (jdbcUserStorage.findByUsername(user.getUsername()).getUsername() != null) {
            return false;
        }
        memoryUserStorage.saveUser(user);
        jdbcUserStorage.saveUser(user);
        return true;
    }

    public void updateUser(String username, String newName, String newPassword){
        memoryUserStorage.updateUser(username, newName, newPassword);
        jdbcUserStorage.updateUser(username, newName, newPassword);
    }

    public  void deleteUser(String username, String password){
        memoryUserStorage.deleteUser(username, password);
        jdbcUserStorage.deleteUser(username, password);
    }

    public void saveOperation(long id, double first, double second, String sign, double result){
        jdbcOperationStorage.saveOperation(id, first, second, sign, result);
    }

    public List<String> findOperationsById(int id){
        return jdbcOperationStorage.findOperationsById(id);
    }

    public boolean setAdminUser (int id){
        return jdbcUserStorage.setAdminUser(id);
    }

    public boolean deleteUserByAdmin(String username){
        return jdbcUserStorage.deleteUserByAdmin(username);
    }

    public long getTempId(){
        return jdbcUserStorage.getTempId();
    }
}