package boardmysql;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

public class BoardDAO {
	
	private static BoardDAO dao= new BoardDAO();
	
	public static BoardDAO getDao(){
		return dao;
	}// getDao end
	
	private BoardDAO(){}
	
	private Connection getCon() throws Exception{
		Context ct = new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}// Connection getCon end
	
	public void insertContent(BoardDTO dto) throws Exception{
		
		int num= dto.getNum();
		int ref= dto.getRef();
		int re_step = dto.getRe_step(); // 글순서
		int re_level = dto.getRe_level();  //답글 깊이
		
		int number=0;
		
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql="";
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select max(num) from board");
			rs=pstmt.executeQuery();//쿼리 수행
			
			if(rs.next()){
				number=rs.getInt(1)+1;
			}else{
				number=1;//number= ref
			}//else end
			
			if(num != 0){
				sql="update board set re_step=re_step+1 where ref=? and re_step>?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				
				re_step=re_step+1;
				re_level=re_level+1;
			}else{//원글
				ref= number;
				re_step=0;
				re_level=0;
			}
			sql="insert into board(mem_id,email,subject,"
					+ "regdate,ref,re_step,"
					+ "re_level,content,ip,category) value(?,?,?,NOW(),?,?,?,?,?,?)";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			pstmt.setString(7, dto.getContent());
			pstmt.setString(8, dto.getIp());
			pstmt.setInt(9, dto.getCategory());
			
			pstmt.executeUpdate();
			
		}catch(Exception ex1){
			System.out.println("insertContent: 예외"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
	
	
}//insertContent end
}
