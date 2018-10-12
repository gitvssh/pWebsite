package member;

import java.sql.*;
import java.util.Vector;

import javax.sql.*;
import javax.naming.*;

import org.apache.tomcat.jdbc.pool.DataSource;

public class MemberDAO {
	
	private static MemberDAO instance=new MemberDAO();
	
	public static MemberDAO getInstance(){
		return instance;
	}//getInstance()
	
	private MemberDAO(){}
	
	private Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getCon() end
	
	
	//----------
	//id중복 체크
	//------------
	 public int confirmId(String id)throws Exception{
		 Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 int x=1;
		 
		 try{
			 con=getCon();//커넥션 얻기
			 pstmt=con.prepareStatement("select id from member where id=?");
			 pstmt.setString(1, id);
			 rs=pstmt.executeQuery();//쿼리수행
			 
			 if(rs.next()){//사용중인 id
				 x=1;
			 }else{//사용가능한 id
				 x=-1;
			 }
		 }catch(Exception ex1){
			 System.out.println("confirmId 예외 : "+ex1);
		 }finally{
			 try{
				 if(rs!=null){rs.close();}
				 if(pstmt!=null){pstmt.close();}
				 if(con!=null){con.close();}
			 }catch(Exception ex2){
				 
			 }
		 }//finally end
		 return x;
	 }//confirmId() end---------------------------------
	
	
	//---------
	//로그인 (인증)
	//-----------
	public int userCheck(String id,String passwd) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbPwd="";
		int x=-1;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dbPwd=rs.getString("passwd");
				
				if(passwd.equals(dbPwd)){
					x=1;//인증성공
				}else{
					x=0;//암호다름
				}
				
			}else{
				x=-1;//아이디 없음
			}//else end
			
		}catch(Exception ex1){
			System.out.println("userCheck() 예외 : "+ex1);
		}finally{
			try{
			if(rs!=null){rs.close();}
			if(pstmt!=null){pstmt.close();}
			if(con!=null){con.close();}
			}catch(Exception ex2){
				
			}
		}//finally end
		
		return x;
	}//useCheck() end---------------------------------------------
	
	
	
	
	
}//class
