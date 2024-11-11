
	package com.jee.dao;

	import com.mongodb.client.MongoDatabase;
	import com.mongodb.client.MongoCollection;
	import com.mongodb.client.model.Filters;
	import org.bson.Document;
	import org.bson.types.ObjectId;
	import com.jee.beans.User;

	public class UserDaoImpl  implements UserDao{
	    private MongoDatabase database;

	    public UserDaoImpl() {
	        this.database = Singleton.getInstance().getDatabase();
	    }

	    public void addUser(String userEmail, String userPassword, String userName) {
	        try {
	            MongoCollection<Document> collection = database.getCollection("Users");

	            System.out.println("Connected to MongoDB");

	            Document userDocument = new Document("userEmail", userEmail)
	                    .append("userPassword", userPassword)
	                    .append("userName", userName);

	            collection.insertOne(userDocument);
	            System.out.println("User added to MongoDB successfully.");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    public void deleteUser(String userName) {
	        try {
	            MongoCollection<Document> collection = database.getCollection("Users");
	            collection.deleteOne(Filters.eq("userName", userName));
	            System.out.println("User deleted successfully.");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public User checkUser(String email, String password) {
	        try {
	            MongoCollection<Document> collection = database.getCollection("Users");
	            Document userDoc = collection.find(Filters.and(
	                    Filters.eq("userEmail", email),
	                    Filters.eq("userPassword", password)
	            )).first();

	            if (userDoc != null) {
	                String userName = userDoc.getString("userName");
	                return new User(email, password, userName); // Assuming userNom and userPrenom are the same as userName for simplicity
	            } else {
	                return null;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    
	    }  
	    
	}


