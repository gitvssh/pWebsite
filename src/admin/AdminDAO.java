package admin;

import java.sql.*;
import java.util.Vector;

import javax.sql.*;//DataSource
import javax.naming.*;//lookup

import org.apache.tomcat.jdbc.pool.DataSource;

import tools.Sha256;

//DAO 비지니스 로직
public class AdminDAO {
	
	//싱글톤 객체 사용, 객체를 하나만 사용하도록 한다. 메모리 절약이 된다
	private static AdminDAO instance=new AdminDAO();//객체 생성
	
	//JSP에서 객체를 얻을 때는  : MemberDAO.getInstance()
	public static AdminDAO getInstance(){
		return instance;
	}//getInstance()
	
	private AdminDAO(){}//디폴트 생성자, 외부에서 객체 생성 못한다,
						//<jsp:useBean>도 사용 못함
	
	//----------------
	//커넥션 풀 사용 메서드
	//----------------
	 private Connection getCon() throws Exception{
		 Context ct=new InitialContext();
		 DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		 return ds.getConnection();
	 }//getCon() end
	 
	 
	
	 //-------------------
	 //로그인(인증)
	 //-------------------
	 public int userCheck(String id,String passwd) throws Exception{
		 
		 Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 String dbPwd="";
		 int x=-1;

		 
		 try{
			 con=getCon();
			 pstmt=con.prepareStatement("select * from admin where id=?");
			 pstmt.setString(1, id);
			 rs=pstmt.executeQuery();//쿼리 수행
			 
			 if(rs.next()){
				 dbPwd=rs.getString("passwd");
				 
				 if(passwd.equals(dbPwd)){
					 x=1;//인증 성공
				 }else{
					 x=0;//암호가 다름
				 }
						 
			 }else{
				 x=-1;//해당 아이디 없음
			 }//else
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
	 }//userCheck() end-----------------------------
	 
	 
	
	 
	 
}//class
