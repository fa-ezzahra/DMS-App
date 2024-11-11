package com.jee.dao;

import com.jee.beans.User;
import com.jee.dao.UserDao;
import com.jee.dao.UserDaoImpl;

public class UserDaoTestMain {
    public static void main(String[] args) {
        // Create an instance of UserDao
        UserDao userDao = new UserDaoImpl();

        /*// Test addUser method
        System.out.println("Testing addUser method...");
        userDao.addUser("test@example.com", "testpassword", "Test User");*/

        // Test checkUser method
        System.out.println("\nTesting checkUser method...");
        User user = userDao.checkUser("test@example.com", "testpassword");
        if (user != null) {
            System.out.println("User found: " + user.getUserName());
        } else {
            System.out.println("User not found.");
        }

        // Test deleteUser method
        /*System.out.println("\nTesting deleteUser method...");
        userDao.deleteUser("Test User");*/

       /* // Test checkUser method again after deletion
        System.out.println("\nTesting checkUser method after deletion...");
        user = userDao.checkUser("test@example.com", "testpassword");
        if (user != null) {
            System.out.println("User found: " + user.getUserName());
        } else {
            System.out.println("User not found.");
        }*/
    }
}
