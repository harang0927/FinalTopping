package model.vo;



public class UploadImageVO {
	int imgNo; // sen===q
	int boardNo;
	String orgName;
	String newName;
	int boardType; // 0
	String savePath;

	public UploadImageVO() {
		super();
	}

	public UploadImageVO(int boardNo, String orgName, String newName,
			int boardType, String savePath) {
		super();
		this.boardNo = boardNo;
		this.orgName = orgName;
		this.newName = newName;
		this.boardType = boardType;
		this.savePath = savePath;
	}

	public UploadImageVO(String orgName, String newName, String savePath) {
		super();
		this.orgName = orgName;
		this.newName = newName;
		this.savePath = savePath;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	@Override
	public String toString() {
		return "UploadImageVO [imgNo=" + imgNo + ", boardNo=" + boardNo
				+ ", orgName=" + orgName + ", newName=" + newName
				+ ", boardType=" + boardType + ", savePath=" + savePath + "]";
	}

}
