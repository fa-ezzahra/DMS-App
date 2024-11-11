package com.jee.business;

import java.util.List;

import org.bson.Document;

import com.jee.beans.DocumentJ;
import com.jee.dao.DocumentDao;
import com.jee.dao.DocumentDaoImpl;

public class DocumentBusinessImpl implements DocumentBusiness{

	private DocumentDao dao;
	

	public DocumentBusinessImpl() {
	}


	public DocumentBusinessImpl(DocumentDao dao) {
		this.dao =dao;
	}
	
	public void uploadFile(String filePath,String fileDescp, String fileUser) {
		dao.uploadFile(filePath, fileDescp, fileUser);
	}
	 public boolean deleteFile(String fileName,String fileUser) {
		return dao.deleteFile(fileName,fileUser);
	 }
	 public List<DocumentJ> searchFiles(String searchParam, String fileType){
		return dao.searchFiles(searchParam, fileType);
	 }
	 public List<DocumentJ> searchFilesbyUser(String searchParam, String fileType, String userName){
		 return dao.searchFilesbyUser(searchParam, fileType, userName);
		 
	 }
	 public List<DocumentJ> getAllFilesByUser(String userName){
		 return dao.getAllFilesByUser(userName);
	 }
	
	 public void downloadDoc(String filepath) {
			dao.retrieveFile(filepath);
			
		}
	 public void deleteFileByPath(String filePath) {
			dao.deleteFileByPath(filePath);
			
		}
	 public List<DocumentJ> getAllFiles() {
			return dao.getAllFiles();
		}
	
	
}
