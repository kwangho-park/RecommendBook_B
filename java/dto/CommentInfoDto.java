package dto;

public class CommentInfoDto {

	private int num;
	private String userName;
	private String pw;
	private String content;
	private int postNum;
	
	public CommentInfoDto() {}
	
	// constructor
	public CommentInfoDto(int num, String userName, String pw, String content, int postNum) {
		super();
		this.num = num;
		this.userName = userName;
		this.pw = pw;
		this.content = content;
		this.postNum = postNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	
	
	
	
}// CommentInfoDto
