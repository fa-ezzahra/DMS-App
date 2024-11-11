package com.jee.dao;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import org.bson.Document;


import com.mongodb.MongoClientURI;

	

	public class Singleton {
	    private static Singleton instance;
	    private MongoClient mongoClient;
	    private MongoDatabase database;

	    private Singleton() {
	        try {
	            // Créer la connexion MongoDB au démarrage de l'application
	        	MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
	            database = mongoClient.getDatabase("fileStorage");
	            System.out.println("Connexion avec MongoDB établie!");
	        } catch (Exception e) {
	            // Gérer les exceptions
	            e.printStackTrace();
	            System.out.println("Erreur lors de la connexion à MongoDB : " + e.getMessage());
	        }
	    }

	    public static synchronized Singleton getInstance() {
	        if (instance == null) {
	            instance = new Singleton();
	        }
	        return instance;
	    }

	    public MongoDatabase getDatabase() {
	        return database;
	    }

	    public void closeConnection() {
	        // Fermer la connexion MongoDB à l'arrêt de l'application
	        if (mongoClient != null) {
	            mongoClient.close();
	            mongoClient = null;
	            database = null;
	            instance = null;
	            System.out.println("Connexion avec MongoDB fermée.");
	        }
	    }
	}


