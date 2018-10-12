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
	//id�ߺ� üũ
	//------------
	 public int confirmId(String id)throws Exception{
		 Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 int x=1;
		 
		 try{
			 con=getCon();//Ŀ�ؼ� ���
			 pstmt=con.prepareStatement("select id from member where id=?");
			 pstmt.setString(1, id);
			 rs=pstmt.executeQuery();//��������
			 
			 if(rs.next()){//������� id
				 x=1;
			 }else{//��밡���� id
				 x=-1;
			 }
		 }catch(Exception ex1){
			 System.out.println("confirmId ���� : "+ex1);
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
	//�α��� (����)
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
					x=1;//��������
				}else{
					x=0;//��ȣ�ٸ�
				}
				
			}else{
				x=-1;//���̵� ����
			}//else end
			
		}catch(Exception ex1){
			System.out.println("userCheck() ���� : "+ex1);
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
