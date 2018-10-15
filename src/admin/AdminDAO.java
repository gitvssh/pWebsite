package admin;

import java.sql.*;
import java.util.Vector;

import javax.sql.*;//DataSource
import javax.naming.*;//lookup

import org.apache.tomcat.jdbc.pool.DataSource;

import tools.Sha256;

//DAO �����Ͻ� ����
public class AdminDAO {
	
	//�̱��� ��ü ���, ��ü�� �ϳ��� ����ϵ��� �Ѵ�. �޸� ������ �ȴ�
	private static AdminDAO instance=new AdminDAO();//��ü ����
	
	//JSP���� ��ü�� ���� ����  : MemberDAO.getInstance()
	public static AdminDAO getInstance(){
		return instance;
	}//getInstance()
	
	private AdminDAO(){}//����Ʈ ������, �ܺο��� ��ü ���� ���Ѵ�,
						//<jsp:useBean>�� ��� ����
	
	//----------------
	//Ŀ�ؼ� Ǯ ��� �޼���
	//----------------
	 private Connection getCon() throws Exception{
		 Context ct=new InitialContext();
		 DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		 return ds.getConnection();
	 }//getCon() end
	 
	 
	
	 //-------------------
	 //�α���(����)
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
			 rs=pstmt.executeQuery();//���� ����
			 
			 if(rs.next()){
				 dbPwd=rs.getString("passwd");
				 
				 if(passwd.equals(dbPwd)){
					 x=1;//���� ����
				 }else{
					 x=0;//��ȣ�� �ٸ�
				 }
						 
			 }else{
				 x=-1;//�ش� ���̵� ����
			 }//else
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
	 }//userCheck() end-----------------------------
	 
	 
	
	 
	 
}//class
