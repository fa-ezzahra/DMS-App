package com.jee.business;

import java.util.List;

import org.bson.Document;

import com.jee.beans.DocumentJ;

public interface DocumentBusiness {
	public void uploadFile(String filePath,String fileDescp, String fileUser);
	 public boolean deleteFile(String fileId,String fileUser);
	 public List<DocumentJ> searchFiles(String searchParam, String fileType);
	 public List<DocumentJ> searchFilesbyUser(String searchParam, String fileType, String userName);
	 public List<DocumentJ> getAllFilesByUser(String userName);
	 public void downloadDoc(String filepath);
	 public  void deleteFileByPath(String filePath);
	 public List<DocumentJ> getAllFiles();

}
