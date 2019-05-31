package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBclose;
import db.DBopen;

public class GuestbookDAO {
	
	public int total(Map map) {
		int total = 0;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from guestbook ");
		
		if(word.trim().length()>0 && col.equals("title_part")) {
			sql.append(" where title like '%'||?||'%' ");
			sql.append(" or part like '%'||?||'%' ");
		}else if(word.trim().length()>0){ 
			sql.append(" where "+col+" like '%'||?||'%' ");
		}
		
		try {
			int i=0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0 && col.equals("title_part")) {
				pstmt.setString(++i,word);
				pstmt.setString(++i,word);				
			}else if(word.trim().length()>0) {
				pstmt.setString(++i,word);
			}			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(rs, pstmt, con);
		}
	
		return total;

	}
				
	
	public boolean passwdCheck(Map map) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int no = (Integer)map.get("no"); //MAP에서 가져온 값을 정수화 
		String passwd = (String)map.get("passwd"); //MAP에서 가져온 값을 문자화
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from guestbook ");
		sql.append(" where no = ? and passwd = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,no);
			pstmt.setString(2,passwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				int cnt =rs.getInt(1);
				
				if(cnt>0) flag = true;
		
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			DBclose.close(rs, pstmt, con);
			
		}
		
		return flag;
	}
	
		
	public List<GuestbookDTO> list(Map map){
		GuestbookDTO dto = null;
		List<GuestbookDTO> list = new ArrayList<>();
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" SELECT no, name, title, part, regdate ,grpno, indent, ansnum, r ");
		sql.append(" FROM( ");
		sql.append(" 	 SELECT no, name, title, part, regdate ,grpno, indent, ansnum, rownum r ");
		sql.append("	FROM( ");
		sql.append("		 SELECT no, name, title, part, regdate ,grpno, indent, ansnum ");
		sql.append(" 		 FROM guestbook ");
		
		
		if(word.trim().length()>0 && col.equals("title_part")) {
			sql.append(" 	 where title like '%'||?||'%' ");
			sql.append(" 	 or part like '%'||?||'%' ");
		}else if(word.trim().length()>0){ 
			sql.append(" 	 where "+col+" like '%'||?||'%' ");
		}
		 sql.append("		 order by grpno desc, ansnum ");
		 sql.append("		 ) " );
		 sql.append("	 ) where r >= ? and r <= ? ");
			
			
		try {
			int i=0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0 && col.equals("title_part")) {
				pstmt.setString(++i,word);
				pstmt.setString(++i,word);				
			}else if(word.trim().length()>0) {
				pstmt.setString(++i,word);
			}			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				 dto = new GuestbookDTO();
				 dto.setNo(rs.getInt("no"));
				 dto.setName(rs.getString("name"));
				 dto.setTitle(rs.getString("title"));
				 dto.setPartstr(rs.getString("part"));
				 dto.setRegdate(rs.getString("regdate"));
				 dto.setGrpno(rs.getInt("grpno"));
				 dto.setIndent(rs.getInt("indent"));
				 dto.setAnsnum(rs.getInt("ansnum"));
				
				 list.add(dto);
				
			}
						
		} catch (SQLException e) {
		
			e.printStackTrace();
		
		} finally {
			
			DBclose.close(rs, pstmt, con);
		
		}		
		
		return list;
	}
	
		
	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt =null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from guestbook where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,no);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) flag = true;
						
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			
			DBclose.close(pstmt, con);
			
		}
		
		return flag;
	
	}
	
	
	public boolean update(GuestbookDTO dto) {
		
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update guestbook ");
		sql.append(" set ");
		sql.append(" title = ?, ");
		sql.append(" content = ?, ");
		sql.append(" part = ? ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPartstr());
			pstmt.setInt(4, dto.getNo());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) flag=true;
						
		} catch (Exception e) {
		
			e.printStackTrace();
			
		} finally {
			
			DBclose.close(pstmt, con);
			
		}
				
		return flag;
		
	}
	
		
	public void upAnsnum(Map map) {
		//부모글 밑에 새 답변이 달릴때, 기존에 달려있던 답변을 밑으로 내려주는 역할. 
		//ex)부모글에 달린 답변이 ansnum = 1일때 새 답변이 달릴경우, 기존의 1이 2로 바뀌면서 새답변이 1을 갖음.
		
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update guestbook set ansnum = ansnum+1 ");
		sql.append(" where grpno = ? and ansnum > ? ");
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,grpno);
			pstmt.setInt(2,ansnum);
			
			pstmt.executeUpdate();
			
									
		} catch (Exception e) {		
			e.printStackTrace();			
		} finally {
			DBclose.close(pstmt, con);
		}
						
	}
	
	
	public GuestbookDTO read(int no) {
		
		GuestbookDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, name, gender, title, content, to_char(regdate, 'yyyy-mm-dd') regdate, part " );
		sql.append(" from guestbook where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new GuestbookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPartstr(rs.getString("part"));
					
			}
			
					
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			
			DBclose.close(rs, pstmt, con);
			
		}

		
		return dto;
			
	}
	
	
	public GuestbookDTO readReply(int no) {
		//부모의 grpno와 ansnum을 가져오는 역할
		GuestbookDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, title, grpno, indent, ansnum " );
		sql.append(" from guestbook where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new GuestbookDTO();
				dto.setNo(rs.getInt("no"));		
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
					
			}	
							
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			
			DBclose.close(rs, pstmt, con);
			
		}

		
		return dto;
			
	}
	
			
	public boolean create(GuestbookDTO dto) {
		
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into guestbook  ");
		sql.append(" (no, name, gender, title, content, regdate, part, passwd, grpno, indent, ansnum ) ");
		sql.append(" values( (select  nvl(max(no),0)+1 from guestbook), ?,?,?,?,sysdate,?,?, ");
		sql.append(" (select nvl(max(grpno),0)+1 as grpno from guestbook),?,?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getGender());
			pstmt.setString(3,dto.getTitle());
			pstmt.setString(4,dto.getContent());
			pstmt.setString(5,dto.getPartstr());
			pstmt.setString(6,dto.getPasswd());
			pstmt.setInt(7, dto.getGrpno());
			pstmt.setInt(8, dto.getIndent());
			pstmt.setInt(9,dto.getAnsnum());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt >0) flag=true;
			
						
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			DBclose.close(pstmt, con);
			
		}
				
		return flag;
		
	}
	
	
	public boolean createReply(GuestbookDTO dto) {
		//새로운 답변을 삽입해주는 역할.
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into guestbook  ");
		sql.append(" (no, name, gender, title, content, regdate, part, passwd, grpno, indent, ansnum ) ");
		sql.append(" values( (select nvl(max(no),0)+1 from guestbook), ?,?,?,?,sysdate,?,?,?,?,?) ");

		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getGender());
			pstmt.setString(3,dto.getTitle());
			pstmt.setString(4,dto.getContent());
			pstmt.setString(5,dto.getPartstr());
			pstmt.setString(6,dto.getPasswd());
			pstmt.setInt(7, dto.getGrpno());
			pstmt.setInt(8, dto.getIndent()+1);
			pstmt.setInt(9,dto.getAnsnum()+1);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt >0) flag=true;
			
						
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			DBclose.close(pstmt, con);
			
		}
				
		return flag;
		
	}

}
