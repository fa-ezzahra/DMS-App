package com.jee.dao;

import com.jee.beans.DocumentJ;

import java.util.List;

public class DocumentDaoTestMain {
    public static void main(String[] args) {
        // Create an instance of DocumentDaoImpl
        DocumentDaoImpl documentDao = new DocumentDaoImpl();

        // Test uploadFile method
        /*System.out.println("Testing uploadFile method...");
        String filePath = "C:/Users/ASUS/Desktop/3.png";
        String fileDescp = "Sample file description";
        String fileUser = "Test User";
        documentDao.uploadFile(filePath, fileDescp, fileUser);*/

      /*  // Test getAllFilesByUser method
        System.out.println("\nTesting getAllFilesByUser method...");
        List<DocumentJ> userFiles = documentDao.getAllFilesByUser("fa");
        for (DocumentJ file : userFiles) {
            System.out.println("File: " + file.getFileName() + ", Description: " + file.getFileDescp());
        }*/

        // Test searchFilesbyUser method
      /*  System.out.println("\nTesting searchFilesbyUser method...");
        List<DocumentJ> searchResults = documentDao.searchFiles("photo", "png");
        for (DocumentJ file : searchResults) {
            System.out.println("File: " + file.getFileName() + ", Description: " + file.getFileDescp());
        }*/

        
        //documentDao.retrieveFile("C:/Users/ASUS/Desktop/3.png");
       System.out.println("\nTesting deleteFileByName method...");
   // String fileNameToDelete = "3.png";
    documentDao.deleteFileByPath("C:/Users/ASUS/Desktop/3.png");/*
    
    
         Verify file deletion
        System.out.println("\nVerifying file deletion...");
        userFiles = documentDao.getAllFilesByUser("fa");
        for (DocumentJ file : userFiles) {
            System.out.println("File: " + file.getFileName() + ", Description: " + file.getFileDescp());
        }*/
    }
}
