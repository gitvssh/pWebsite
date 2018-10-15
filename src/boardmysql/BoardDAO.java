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
		int re_step = dto.getRe_step(); // �ۼ���
		int re_level = dto.getRe_level();  //��� ����
		
		int number=0;
		
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql="";
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select max(num) from board");
			rs=pstmt.executeQuery();//���� ����
			
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
			}else{//����
				ref= number;
				re_step=0;
				re_level=0;
			}
			sql="insert into board(id,email,subject,"
					+ "regdate,ref,re_step,"
					+ "re_level,content,ip,category) value(?,?,?,NOW(),?,?,?,?,?,?)";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
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
			System.out.println("insertContent: ����"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
	
	
}//insertContent end
	
	// �� ����
	public int getArticleCount() throws Exception{
		int cnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getCon();
			pstmt = con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt = rs.getInt(1); // �� ����
			}
			
		}catch(Exception ex1){
			System.out.println("getArticleCount() ���� : " + ex1);
			
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
				
			}catch(Exception ex2){}
		} // finally end
		
		return cnt;
		
	} // getArticleCount end
	
	
	// ����Ʈ
	public List getList(int start, int cnt) throws Exception{
		List<BoardDTO> list = null; // ����
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			con = getCon();
			sql = "select * from board order by ref desc, re_step asc limit ?,?"; // ������ġ, �
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1); // ���� ��ġ
			pstmt.setInt(2, cnt); // �� ����
			rs = pstmt.executeQuery(); // ���� ����
			
			if(rs.next()){ // ���� ������
				list = new ArrayList<BoardDTO>();
				
				do{
					BoardDTO dto = new BoardDTO();
					
					dto.setNum(rs.getInt("num")); // �۳ѹ�
					dto.setId(rs.getString("id")); // �ۼ��� ID
					dto.setEmail(rs.getString("email")); // �̸���
					dto.setSubject(rs.getString("subject")); // ����
					
					dto.setRegdate(rs.getTimestamp("regdate")); // �ۼ���
					dto.setReadcount(rs.getInt("readcount")); // ���� ��
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_level(rs.getInt("re_level"));
					
					dto.setContent(rs.getString("content"));
					dto.setIp(rs.getString("ip"));
					dto.setCategory(rs.getInt("category"));
					
					list.add(dto); // list�� �ִ´�
				}while(rs.next());
			}
			
			
		}catch(Exception ex1){
			System.out.println("getList() ���� : " + ex1);
			
		}finally{
			try{
				if(rs!= null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
				
			}catch(Exception ex2){}
			
		} // finally end
		
		
		return list;
		
	} // getList end
	
	 public BoardDTO getArticle(int num) throws Exception{
	      BoardDTO dto = null;
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "";
	      
	      try{
	         con = getCon();
	         //��ȸ������
	         sql="update board set readcount=readcount+1 where num=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.executeUpdate();
	         
	         //�۳��� ���� �ϱ����� ���� ����
	         pstmt = con.prepareStatement("select * from board where num=?");
	         pstmt.setInt(1, num);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()){
	            dto = new BoardDTO();
	            
	            dto.setNum(rs.getInt("num"));
	            dto.setId(rs.getString("id"));
	            dto.setEmail(rs.getString("email"));
	            dto.setSubject(rs.getString("subject"));
	            
	            
	            dto.setRegdate(rs.getTimestamp("regdate"));
	            dto.setReadcount(rs.getInt("readcount"));
	            
	            dto.setRef(rs.getInt("ref"));
	            dto.setRe_step(rs.getInt("re_step"));
	            dto.setRe_level(rs.getInt("re_level"));
	            
	            dto.setContent(rs.getString("content"));
	            dto.setIp(rs.getString("ip"));
	            dto.setCategory(rs.getInt("category"));
	         }//if
	         
	      }catch(Exception e){
	         System.out.println("getArticle() ���� : " + e);
	      }finally{
	         try{
	            if(rs != null){rs.close();}
	            if(pstmt != null){pstmt.close();}
	            if(con != null){con.close();}
	         }catch(Exception e1){}
	      }//finally
	      
	      return dto;
	   }//getArticle() end
	 //------------------------------------
	   //�� ���� �� => jsp�� ���� �ڷ� ó��
	   //------------------------------------
	   public BoardDTO updateGetArticle(int num) throws Exception{
	      BoardDTO dto = null;
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try{
	         con = getCon();
	         pstmt = con.prepareStatement("select * from board where num=?");
	         pstmt.setInt(1, num);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()){
	            dto = new BoardDTO();
	            
	            dto.setNum(rs.getInt("num"));
	            dto.setId(rs.getString("id"));
	            dto.setEmail(rs.getString("email"));
	            dto.setSubject(rs.getString("subject"));

	            
	            dto.setRegdate(rs.getTimestamp("regdate"));
	            dto.setReadcount(rs.getInt("readcount"));
	            
	            dto.setRef(rs.getInt("ref"));
	            dto.setRe_step(rs.getInt("re_step"));
	            dto.setRe_level(rs.getInt("re_level"));
	            
	            dto.setContent(rs.getString("content"));
	            dto.setIp(rs.getString("ip"));
	         }//if
	      }catch(Exception e){
//	         System.out.println("updateGetArticle() ���� : " + e);
	      }finally{
	         try{
	            if(rs != null){rs.close();}
	            if(pstmt != null){pstmt.close();}
	            if(con != null){con.close();}
	         }catch(Exception e1){}
	      }//finally end
	      
	      return dto;
	   }//updateGetArticle() end
	   
	   //-------------------
	   //�ۼ��� DB�� �۾�
	   //-------------------
	   public int updateArticle(BoardDTO dto) throws Exception{
	      String dbPasswd = "";
	      int x = -1;
	      
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try{
	         con = getCon();
	         pstmt = con.prepareStatement("select passwd from board where num=?");
	         pstmt.setInt(1, dto.getNum());
	         rs = pstmt.executeQuery();
	         String sql="";
	         if(rs.next()){//
	             dbPasswd=rs.getString("passwd");
	             
	             if(dbPasswd.equals(dto.getPasswd())){
	            	 //��ȣ�� ��ġ�ϸ� �ۼ���
	            	 sql="update board set id=?, email=?, subject=?, content=? where num=?";
	            	 pstmt=con.prepareStatement(sql);
	            	 
	            	 pstmt.setString(1, dto.getId());
	            	 pstmt.setString(2, dto.getEmail());
	            	 pstmt.setString(3, dto.getSubject());
	            	 pstmt.setString(4, dto.getContent());
	            	 pstmt.setInt(5, dto.getNum());
	            	 
	            	 pstmt.executeUpdate();//���� ����
	            	 x=1;//���� ����
	             }else{
	            	 //��ȣ�� Ʋ����
	            	 x=0;
	             }//else end
	         }//if end
	      }catch(Exception ex1){
	         System.out.println("updateArticle() ���� : " + ex1);
	      }finally{
	         try{
	            if(rs != null){rs.close();}
	            if(pstmt != null){pstmt.close();}
	            if(con != null){con.close();}
	         }catch(Exception ex2){}
	      }//finally end
	      
	      return x;
	   }//updateArticle() end
	   
	   //---------------------
	   //     �ۻ���
	   //---------------------
	   public int deleteArticle(int num,String passwd) throws Exception{
		   String dbPasswd="";
		   int x=-100;
		   
		   Connection con=null;
		   PreparedStatement pstmt= null;
		   ResultSet rs=null;
		   
		   try{
			   con=getCon();
			   pstmt=con.prepareStatement("select passwd from board where num=?");
			   pstmt.setInt(1, num);
			   rs=pstmt.executeQuery();
			   
			   if(rs.next()){
				   dbPasswd=rs.getString("passwd");
				   
				   if(dbPasswd.equals(passwd)){//��ȣ�� ��ġ�ϸ� ����
					   //��ȣ�� ��ġ�ϸ� �ۻ���
					   pstmt=con.prepareStatement("delete from board where num=?");
					   pstmt.setInt(1, num);
					   pstmt.executeUpdate();
					   
					   x=1; //���� ����
				   }else{//��ȣ�� Ʋ����
					   x=0; //���� ����
				   }//else
			   }//if
			   
		   }catch(Exception ex1){
			   System.out.println("deleteArticle() ���� :" +ex1);
		   }finally{
			   try{
				   if(rs!=null){rs.close();}
				   if(pstmt!=null){pstmt.close();}
				   if(con!=null){con.close();}
			   }catch(Exception ex2){}
		   }//finally end
		   return x;
		   
	   }//deleteArticle() end................
	   
	   
	   
	   //�˻�
	   public Vector<BoardDTO> getBoardList(String keyField, String keyWord){
		   Vector<BoardDTO> vec = new Vector<BoardDTO>();
		   Connection con=null;
		   Statement stmt =null;
		   ResultSet rs=null;
		   String sql="";
		   
		   try{
			   con=getCon();
			   stmt=con.createStatement();
			   
			   if(keyWord.equals(null) || keyWord.equals("")){
					//��ü��
					sql="select * from board order by ref desc";
				}else{//�˻��� ��
					sql="select * from board where "+
							keyField+" like '%"+keyWord+"%'"+" order by ref desc";
							
				}//else 
			   rs=stmt.executeQuery(sql);
			   
			   while(rs.next()){
				   BoardDTO dto= new BoardDTO();
				   
				    dto.setNum(rs.getInt("num"));
		            dto.setId(rs.getString("id"));
		            dto.setEmail(rs.getString("email"));
		            dto.setSubject(rs.getString("subject"));
		            
		            dto.setRegdate(rs.getTimestamp("regdate"));
		            dto.setReadcount(rs.getInt("readcount"));
		            
		            dto.setRef(rs.getInt("ref"));
		            dto.setRe_step(rs.getInt("re_step"));
		            dto.setRe_level(rs.getInt("re_level"));
		            
		            dto.setContent(rs.getString("content"));
		            dto.setIp(rs.getString("ip"));
		            dto.setCategory(rs.getInt("category"));
		            
		            vec.add(dto);
		         
			   }
		   }catch(Exception ex1){
			   System.out.println("List ���� :" + ex1);
		   }finally{
			   try{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(con!=null){con.close();}

			   }catch (Exception ex2){}
		   }
		   return vec;
	   }
		

	
}
