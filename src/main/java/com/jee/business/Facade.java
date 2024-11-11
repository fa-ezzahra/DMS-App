package com.jee.business;

import java.util.List;

import com.jee.beans.DocumentJ;
import com.jee.beans.User;
import com.jee.dao.DocumentDao;
import com.jee.dao.UserDao;
import com.jee.dao.DocumentDaoImpl;
import com.jee.dao.UserDaoImpl;

public class Facade {
	private DocumentBusiness doc;
	private UserBusiness user;
	
	public Facade() {
		DocumentDao daodoc = new DocumentDaoImpl();
		doc=new DocumentBusinessImpl(daodoc);
		
		
		UserDao daouser = new UserDaoImpl();
		user= new UserBusinessImpl(daouser);
		
	}
	
	public void uploadFile(String filePath,String fileDescp, String fileUser) {
		doc.uploadFile(filePath, fileDescp, fileUser);
	}
	 public boolean deleteFile(String fileId,String fileUser) {
		return doc.deleteFile(fileId,fileUser);
	 }
	 public List<DocumentJ> searchFiles(String searchParam, String fileType){
		 return doc.searchFiles(searchParam, fileType);
	 }
	 public List<DocumentJ> searchFilesbyUser(String searchParam, String fileType, String userName){
		 return doc.searchFilesbyUser(searchParam, fileType, userName);
	 }
	 public List<DocumentJ> getAllFilesByUser(String userName){
		 return doc.getAllFilesByUser(userName);
	 }
	 
	 
	 public void addUser(String userEmail, String userPassword, String userName) {
			user.addUser(userEmail, userPassword, userName);
		}
		
		public void deleteUser(String userName) {
			user.deleteUser(userName);
		}
		
		public User checkUser(String email, String password) {
			return user.checkUser(email, password);
		 }
		
		public void downloadDoc(String filepath) {
			doc.downloadDoc(filepath);
		}
		public void deleteFileByPath(String filePath) {
			doc.deleteFileByPath(filePath);
			
		}
		
		 public List<DocumentJ> getAllFiles() {
				return doc.getAllFiles();
			}
}
