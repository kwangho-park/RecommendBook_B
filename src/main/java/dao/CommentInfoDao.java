package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.CommentInfoDto;

@Repository
public class CommentInfoDao {

	private JdbcTemplate jdbcTemplate;

	public CommentInfoDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	
	
	// 댓글 조회 //
	// 게시글의 번호를 받아서 이름, 내용, 댓글번호(=히든) 조회
	public List<CommentInfoDto> allSelect(int postNum){
		
		List<CommentInfoDto> results = jdbcTemplate.query(
				
				// 첫번째 인자
				"SELECT * FROM commentInfo WHERE postNum=? ORDER BY num DESC",
				
				// 두번째 인자
				new RowMapper<CommentInfoDto>() {
					
					@Override
					public CommentInfoDto mapRow(ResultSet rs, int rowNum) throws SQLException{
						
						CommentInfoDto commentInfoDto = new CommentInfoDto();
								
						commentInfoDto.setCommentNum(rs.getInt("num"));
						commentInfoDto.setUserName(rs.getString("userName"));
						commentInfoDto.setContent(rs.getString("content"));
					
						
						return commentInfoDto;
					}
				},
				
				// 세번째 인자
				postNum
				
				);
		
		
		return results;
		
	} // allSelect() END
	
	
	
	
	// 특정 댓글 삭제 // 
	public void delete(int commentNum) {
		
		jdbcTemplate.update(
				
				"DELETE FROM commentInfo WHERE num = ?",
				
				commentNum
				
				);
		
	} // delete() END
	
	
	
	
	// 특정 게시글의 전체 댓글 삭제 //
	public void deleteAll(int postNum) {
		
		jdbcTemplate.update(
				
				"DELETE FROM commentInfo WHERE postNum = ?",
				
				postNum
				
				);
		
	} // deleteAll() END
	
	
	
	
	
	// 특정 댓글 조회 //
	public CommentInfoDto select(int commentNum) {
		
		CommentInfoDto result = jdbcTemplate.queryForObject(
					"SELECT * FROM commentInfo WHERE num=?",

					new Object[] {commentNum},
					
					new RowMapper<CommentInfoDto>() {
						public CommentInfoDto mapRow(ResultSet rs, int rowNum) throws SQLException{
							
							CommentInfoDto commentInfoDto = new CommentInfoDto();
							
							commentInfoDto.setCommentNum(rs.getInt("num"));
							commentInfoDto.setUserName(rs.getString("userName"));
							commentInfoDto.setPw(rs.getString("pw"));
							commentInfoDto.setContent(rs.getString("content"));
							commentInfoDto.setPostNum(rs.getInt("postNum"));
							
							return commentInfoDto;
						}
					}
				);
		
		return result;		
	}// select() END
	
	
	// 특정 댓글 저장 // 
	public void save(CommentInfoDto commentInfoDto) {
		
		jdbcTemplate.update(
				"UPDATE commentInfo SET userName=?, pw=?, content=? WHERE num=?",
				
				commentInfoDto.getUserName(),
				commentInfoDto.getPw(),
				commentInfoDto.getContent(),
				
				commentInfoDto.getCommentNum()
				);
		
	}// save() END
	
	
	// 신규 댓글 저장 // 
	public void newSave(CommentInfoDto commentInfoDto) {
		
		jdbcTemplate.update(
				"INSERT INTO commentInfo(userName, pw, content, postNum) VALUES (?,?,?,?)",
				
				commentInfoDto.getUserName(),
				commentInfoDto.getPw(),
				commentInfoDto.getContent(),
				commentInfoDto.getPostNum()
				);
		
	}// save() END
	
	
	
} // CommentInfoDao END
