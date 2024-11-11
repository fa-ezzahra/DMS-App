package com.jee.beans;

public class DocumentJ {

	private String filePath ; 
    private String fileName ; 
	private String fileType ;
	private long fileSize ;
	private String fileDescp;
	private String fileUser;
	
	public DocumentJ() {
		super();
	}
	public DocumentJ(String filePath, String fileName, String fileType, long fileSize, String fileDescp, String fileUser) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileType = fileType;
		this.fileSize = fileSize;
		this.fileDescp = fileDescp;
		this.fileUser = fileUser;
	}
	
	
	public String getFileDescp() {
		return fileDescp;
	}
	public void setFileDescp(String fileDescp) {
		this.fileDescp = fileDescp;
	}
	public String getFileUser() {
		return fileUser;
	}
	public void setFileUser(String fileUser) {
		this.fileUser = fileUser;
	}
	
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	@Override
	public String toString() {
		return "Document [filePath=" + filePath + ", fileName=" + fileName + ", fileType=" + fileType + ", fileSize="
				+ fileSize + ", fileDescp=" + fileDescp + ", fileUser=" + fileUser + "]";
	}
	

}
