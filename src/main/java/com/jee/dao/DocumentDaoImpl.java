package com.jee.dao;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.jee.beans.DocumentJ;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.result.DeleteResult;

import org.bson.types.Binary;
	

	public class DocumentDaoImpl implements DocumentDao {

	    private MongoDatabase database;
	    private static int i=0;

	    public DocumentDaoImpl() {
	        this.database = Singleton.getInstance().getDatabase();
	    }

	    public void uploadFile(String filePath,String fileDescp, String fileUser) {
	    	try {
	            // Vérifier les informations sur le fichier
	            File File1 = new File(filePath);

	            if (File1.exists() && File1.isFile()) {
	                // Obtenir le nom du fichier
	                String fileName = File1.getName();
	                // Obtenir le type de fichier
	                String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
	                MongoCollection<Document> collection = database.getCollection("Files");

		            System.out.println("Connected to MongoDB");

	                // Get file size
	                long fileSize = File1.length();

	                // Read  file bytes
	                FileInputStream fileInputStream = new FileInputStream(File1);
	                byte[] fileBytes = new byte[(int) fileSize];
	                fileInputStream.read(fileBytes);
	                fileInputStream.close();

	                // Upload  file to MongoDB
	                Document Metadata = new Document("fileName", fileName)
	                        .append("fileType", fileType)
	                        .append("fileSize", fileSize)
	                        .append("fileBytes", fileBytes)// Storing file bytes directly for simplicity
	                        .append("fileDesc",fileDescp)
	                        .append("fileUser",fileUser)
	                         .append("filePath",filePath);
	                        

	                collection.insertOne(Metadata);
	                System.out.println(" file uploaded to MongoDB successfully.");

	               
	            } else {
	                System.out.println("Le fichier  n'existe pas ou n'est pas un fichier régulier.");
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	   

	    

	    public boolean deleteFile(String fileName, String fileUser) {
	        try {
	            MongoCollection<Document> collection = database.getCollection("Files");
	            long deletedCount = collection.deleteOne(Filters.and(
	                    Filters.eq("fileName", fileName),
	                    Filters.eq("fileUser", fileUser)
	            )).getDeletedCount();
	            
	            return deletedCount > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    
	    
	    
	    
	    
	    public List<DocumentJ> getAllFilesByUser(String userName) {
	        List<DocumentJ> files = new ArrayList<>();
	        try {
	            System.out.println("Fetching documents for user: " + userName);
	            MongoCollection<Document> collection = database.getCollection("Files");

	            List<Document> docs = collection.find(Filters.eq("fileUser", userName)).into(new ArrayList<>());
	            System.out.println("Number of documents found: " + docs.size());

	            for (Document doc : docs) {
	                System.out.println("Processing document: " + doc.toJson());

	                String filePath = doc.getString("filePath");
	                String fileName = doc.getString("fileName");
	                String fileType = doc.getString("fileType");
	                Long fileSize = doc.getLong("fileSize");
	                String fileDesc = doc.getString("fileDesc");
	                String fileUser = doc.getString("fileUser");

	                System.out.println("filePath: " + filePath);
	                System.out.println("fileName: " + fileName);
	                System.out.println("fileType: " + fileType);
	                System.out.println("fileSize: " + fileSize);
	                System.out.println("fileDesc: " + fileDesc);
	                System.out.println("fileUser: " + fileUser);

	                DocumentJ file = new DocumentJ(
	                    filePath,  // First parameter should be filePath
	                    fileName,  // Second parameter should be fileName
	                    fileType,  // Third parameter should be fileType
	                    fileSize,  // Fourth parameter should be fileSize
	                    fileDesc,  // Fifth parameter should be fileDesc
	                    fileUser   // Sixth parameter should be fileUser
	                );
	                files.add(file);
	            }
	        } catch (Exception e) {
	            System.err.println("An error occurred while fetching documents:");
	            e.printStackTrace();
	        }
	        return files;
	    }

	    
	    
	    
	    
	    
	    
	    
	    
	    
	    public List<DocumentJ> searchFilesbyUser(String searchParam, String fileType, String userName) {
	        List<DocumentJ> files = new ArrayList<>();
	        try {
	            MongoCollection<Document> collection = database.getCollection("Files");

	            if (searchParam == null || searchParam.isEmpty()) {
	                throw new IllegalArgumentException("Search parameter cannot be null or empty.");
	            }

	            List<Document> queryResults;
	            if (fileType == null || fileType.isEmpty()) {
	                // Search by fileDescp or fileName using regex for partial matches
	                queryResults = collection.find(Filters.and(
	                        Filters.eq("fileUser", userName),
	                        Filters.or(
	                                Filters.regex("fileDesc", ".*" + searchParam + ".*", "i"), // case-insensitive match
	                                Filters.regex("fileName", ".*" + searchParam + ".*", "i")
	                        )
	                )).into(new ArrayList<>());
	            } else {
	                // Search by fileDescp or fileName and fileType using regex for partial matches
	                queryResults = collection.find(Filters.and(
	                        Filters.eq("fileUser", userName),
	                        Filters.or(
	                                Filters.regex("fileDesc", ".*" + searchParam + ".*", "i"),
	                                Filters.regex("fileName", ".*" + searchParam + ".*", "i")
	                        ),
	                        Filters.eq("fileType", fileType)
	                )).into(new ArrayList<>());
	            }

	            for (Document doc : queryResults) {
	                DocumentJ file = new DocumentJ(
	                        doc.getString("filePath"),
	                        doc.getString("fileName"),
	                        doc.getString("fileType"),
	                        doc.getLong("fileSize"),
	                        doc.getString("fileDesc"),
	                        doc.getString("fileUser")
	                );
	                files.add(file);
	            }
	        } catch (Exception e) {
	            e.printStackTrace(); // Use a logger in a real application
	        }
	        return files;
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    public List<DocumentJ> searchFiles(String searchParam, String fileType) {
	        List<DocumentJ> files = new ArrayList<>();
	        try {
	            MongoCollection<Document> collection = database.getCollection("Files");

	            List<Document> queryResults;

	            if (searchParam == null || searchParam.isEmpty()) {
	                throw new IllegalArgumentException("Search parameter cannot be null or empty.");
	            }

	            if (fileType == null || fileType.isEmpty()) {
	                // Search by fileDescp or fileName using regex for partial matches
	                queryResults = collection.find(Filters.or(
	                        Filters.regex("fileDesc", ".*" + Pattern.quote(searchParam) + ".*", "i"),
	                        Filters.regex("fileName", ".*" + Pattern.quote(searchParam) + ".*", "i")
	                )).into(new ArrayList<>());
	            } else {
	                // Search by fileDescp or fileName and fileType using regex for partial matches
	                queryResults = collection.find(Filters.and(
	                        Filters.or(
	                                Filters.regex("fileDesc", ".*" + Pattern.quote(searchParam) + ".*", "i"),
	                                Filters.regex("fileName", ".*" + Pattern.quote(searchParam) + ".*", "i")
	                        ),
	                        Filters.eq("fileType", fileType)
	                )).into(new ArrayList<>());
	            }

	            for (Document doc : queryResults) {
	                DocumentJ file = new DocumentJ(
	                        doc.getString("filePath"),
	                        doc.getString("fileName"),
	                        doc.getString("fileType"),
	                        doc.getLong("fileSize"),
	                        doc.getString("fileDesc"),
	                        doc.getString("fileUser")
	                );
	                files.add(file);
	            }
	        } catch (Exception e) {
	            e.printStackTrace(); // Use a logger in a real application
	        }
	        return files;
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    public void retrieveFile(String filePath) {
	        MongoCollection<Document> collection = database.getCollection("Files");
	        Document fileMetadata = collection.find(new Document("filePath", filePath)).first();

	        if (fileMetadata != null) {
	            byte[] fileBytes = ((Binary) fileMetadata.get("fileBytes")).getData();
	            String fileType = fileMetadata.getString("fileType");

	            // Get the user's home directory path
	            String userHomePath = System.getProperty("user.home");
	            // Create a sub-directory for your application
	            String saveDirectory = userHomePath + File.separator + "MyAppDownloads";
	            File saveDir = new File(saveDirectory);
	            if (!saveDir.exists()) {
	                saveDir.mkdirs(); // Create the directory if it doesn't exist
	            }
	            i++;

	            // Full path of the file to be saved
	            String saveFilePath = saveDirectory + File.separator + "mon_fichier" + i + "." + fileType;

	            try (FileOutputStream fos = new FileOutputStream(saveFilePath)) {
	                fos.write(fileBytes);
	                System.out.println("File downloaded successfully to " + saveFilePath);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        } else {
	            System.out.println("File not found.");
	        }
	    }

         
	    
	    public void deleteFileByPath(String filePath) {
	        try {
	            // Select the collection
	            MongoCollection<Document> collection = database.getCollection("Files");

	            // Print the file path for debugging
	            System.out.println("Attempting to delete file with path: " + filePath);

	            // Delete the document with the specified file path
	            DeleteResult result = collection.deleteOne(Filters.eq("filePath", filePath));

	            // Check the delete result
	            if (result.getDeletedCount() > 0) {
	                System.out.println("File deleted successfully.");
	            } else {
	                System.out.println("File not found. No documents deleted.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    
	    
	    
	    
	    
	  
	    public List<DocumentJ> getAllFiles() {
	        List<DocumentJ> files = new ArrayList<>();
	        try {
	            MongoCollection<Document> collection = database.getCollection("Files");
	            for (Document doc : collection.find().into(new ArrayList<>())) {
	                DocumentJ file = new DocumentJ(
	                    doc.getString("filePath"),
	                    doc.getString("fileName"),
	                    doc.getString("fileType"),
	                    doc.getLong("fileSize"),
	                    doc.getString("fileDesc"),
	                    doc.getString("fileUser")
	                );
	                files.add(file);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return files;
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	}


