package dto;

public class CommentInfoDto {

	private int commentNum;
	private String userName;
	private String pw;
	private String content;
	private int postNum;		// 게시글 번호 (fk)
	
	public CommentInfoDto() {}
	
	// constructor
	public CommentInfoDto(int commentNum, String userName, String pw, String content, int postNum) {
		super();
		this.commentNum = commentNum;
		this.userName = userName;
		this.pw = pw;
		this.content = content;
		this.postNum = postNum;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
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
