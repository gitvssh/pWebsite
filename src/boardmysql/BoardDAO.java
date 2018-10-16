
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
		int re_step = dto.getRe_step(); // 占쌜쇽옙占쏙옙
		int re_level = dto.getRe_level();  //占쏙옙占� 占쏙옙占쏙옙
		
		int number=0;
		
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql="";
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select max(num) from board");
			rs=pstmt.executeQuery();//占쏙옙占쏙옙 占쏙옙占쏙옙
			
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
			}else{//占쏙옙占쏙옙
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
			System.out.println("insertContent: 占쏙옙占쏙옙"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
	
	
}//insertContent end
	
	// 占쏙옙 占쏙옙占쏙옙
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
				cnt = rs.getInt(1); // 占쏙옙 占쏙옙占쏙옙
			}
			
		}catch(Exception ex1){
			System.out.println("getArticleCount() 占쏙옙占쏙옙 : " + ex1);
			
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
				
			}catch(Exception ex2){}
		} // finally end
		
		return cnt;
		
	} // getArticleCount end
	
	
	// 占쏙옙占쏙옙트
	public List getList(int start, int cnt) throws Exception{
		List<BoardDTO> list = null; // 占쏙옙占쏙옙
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			con = getCon();
			sql = "select * from board order by ref desc, re_step asc limit ?,?"; // 占쏙옙占쏙옙占쏙옙치, 占쏘개
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1); // 占쏙옙占쏙옙 占쏙옙치
			pstmt.setInt(2, cnt); // 占쏙옙 占쏙옙占쏙옙
			rs = pstmt.executeQuery(); // 占쏙옙占쏙옙 占쏙옙占쏙옙
			
			if(rs.next()){ // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
				list = new ArrayList<BoardDTO>();
				
				do{
					BoardDTO dto = new BoardDTO();
					
					dto.setNum(rs.getInt("num")); // 占쌜넘뱄옙
					dto.setId(rs.getString("id")); // 占쌜쇽옙占쏙옙 ID
					dto.setEmail(rs.getString("email")); // 占싱몌옙占쏙옙
					dto.setSubject(rs.getString("subject")); // 占쏙옙占쏙옙
					
					dto.setRegdate(rs.getTimestamp("regdate")); // 占쌜쇽옙占쏙옙
					dto.setReadcount(rs.getInt("readcount")); // 占쏙옙占쏙옙 占쏙옙
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_level(rs.getInt("re_level"));
					
					dto.setContent(rs.getString("content"));
					dto.setIp(rs.getString("ip"));
					dto.setCategory(rs.getInt("category"));
					
					list.add(dto); // list占쏙옙 占쌍는댐옙
				}while(rs.next());
			}
			
			
		}catch(Exception ex1){
			System.out.println("getList() 占쏙옙占쏙옙 : " + ex1);
			
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
	         //占쏙옙회占쏙옙占쏙옙占쏙옙
	         sql="update board set readcount=readcount+1 where num=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.executeUpdate();
	         
	         //占쌜놂옙占쏙옙 占쏙옙占쏙옙 占싹깍옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
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
	         System.out.println("getArticle() 占쏙옙占쏙옙 : " + e);
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
	   //占쏙옙 占쏙옙占쏙옙 占쏙옙 => jsp占쏙옙 占쏙옙占쏙옙 占쌘뤄옙 처占쏙옙
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
//	         System.out.println("updateGetArticle() 占쏙옙占쏙옙 : " + e);
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
	   //占쌜쇽옙占쏙옙 DB占쏙옙 占쌜억옙
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
	            	 //占쏙옙호占쏙옙 占쏙옙치占싹몌옙 占쌜쇽옙占쏙옙
	            	 sql="update board set id=?, email=?, subject=?, content=? where num=?";
	            	 pstmt=con.prepareStatement(sql);
	            	 
	            	 pstmt.setString(1, dto.getId());
	            	 pstmt.setString(2, dto.getEmail());
	            	 pstmt.setString(3, dto.getSubject());
	            	 pstmt.setString(4, dto.getContent());
	            	 pstmt.setInt(5, dto.getNum());
	            	 
	            	 pstmt.executeUpdate();//占쏙옙占쏙옙 占쏙옙占쏙옙
	            	 x=1;//占쏙옙占쏙옙 占쏙옙占쏙옙
	             }else{
	            	 //占쏙옙호占쏙옙 틀占쏙옙占쏙옙
	            	 x=0;
	             }//else end
	         }//if end
	      }catch(Exception ex1){
	         System.out.println("updateArticle() 占쏙옙占쏙옙 : " + ex1);
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
	   //     占쌜삼옙占쏙옙
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
				   
				   if(dbPasswd.equals(passwd)){//占쏙옙호占쏙옙 占쏙옙치占싹몌옙 占쏙옙占쏙옙
					   //占쏙옙호占쏙옙 占쏙옙치占싹몌옙 占쌜삼옙占쏙옙
					   pstmt=con.prepareStatement("delete from board where num=?");
					   pstmt.setInt(1, num);
					   pstmt.executeUpdate();
					   
					   x=1; //占쏙옙占쏙옙 占쏙옙占쏙옙
				   }else{//占쏙옙호占쏙옙 틀占쏙옙占쏙옙
					   x=0; //占쏙옙占쏙옙 占쏙옙占쏙옙
				   }//else
			   }//if
			   
		   }catch(Exception ex1){
			   System.out.println("deleteArticle() 占쏙옙占쏙옙 :" +ex1);
		   }finally{
			   try{
				   if(rs!=null){rs.close();}
				   if(pstmt!=null){pstmt.close();}
				   if(con!=null){con.close();}
			   }catch(Exception ex2){}
		   }//finally end
		   return x;
		   
	   }//deleteArticle() end................
	   
	   
	   
	   //占싯삼옙
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
					//占쏙옙체占쏙옙
					sql="select * from board order by ref desc";
				}else{//占싯삼옙占쏙옙 占쏙옙
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
			   System.out.println("List 占쏙옙占쏙옙 :" + ex1);
		   }finally{
			   try{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(con!=null){con.close();}

			   }catch (Exception ex2){}
		   }
		   return vec;
	   }
		
//==============================================================================================================
	   //event DAO
	   public Vector<EventDTO> getAllEvent() throws Exception{
			Vector<EventDTO> vec =new Vector<EventDTO>();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				con=getCon();//커넥션 얻기
				String sql="select * from event";
		        pstmt=con.prepareStatement(sql);
		        rs=pstmt.executeQuery();//쿼리실행
				while(rs.next()){
					EventDTO edto=new EventDTO(); // 占쏙옙占쏙옙
						edto.setEvent_id(rs.getInt("event_id"));
						edto.setEvent_title(rs.getString("event_title"));
						edto.setEvent_startDate(rs.getDate("event_startDate"));
						edto.setEvent_endDate(rs.getDate("event_endDate"));
						edto.setEvent_info(rs.getString("event_info"));
						edto.setEvent_win(rs.getInt("event_win"));
						edto.setEvent_point(rs.getInt("event_point"));
						edto.setEvent_img(rs.getString("event_img"));
						edto.setId(rs.getString("id"));//관리자 id
						
						vec.add(edto);
				}
			}catch(Exception ex1){
				System.out.println("eventList() 占쏙옙占쏙옙 : " + ex1);
				
			}finally{
				try{
					if(rs!= null){rs.close();}
					if(pstmt!=null){pstmt.close();}
					if(con!=null){con.close();}
					
				}catch(Exception ex2){}
				
			} // finally end
			return vec;
		} // getEvent end
	   public EventDTO getEvent(int event_id) throws Exception{
		      EventDTO edto = null;
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = "";
		      
		      try{
		         con = getCon();
		         sql="select * from event where event_id=?";
		        
		         
		         //占쌜놂옙占쏙옙 占쏙옙占쏙옙 占싹깍옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, event_id);
		         rs = pstmt.executeQuery();
		         
		         if(rs.next()){
		            edto = new EventDTO();
		            
		        	edto.setEvent_id(rs.getInt("event_id"));
					edto.setEvent_title(rs.getString("event_title"));
					edto.setEvent_startDate(rs.getDate("event_startDate"));
					edto.setEvent_endDate(rs.getDate("event_endDate"));
					edto.setEvent_info(rs.getString("event_info"));
					edto.setEvent_win(rs.getInt("event_win"));
					edto.setEvent_point(rs.getInt("event_point"));
					edto.setEvent_img(rs.getString("event_img"));
					edto.setId(rs.getString("id"));//관리자 id
		         }//if
		         
		      }catch(Exception e){
		         System.out.println("getEvent() 占쏙옙占쏙옙 : " + e);
		      }finally{
		         try{
		            if(rs != null){rs.close();}
		            if(pstmt != null){pstmt.close();}
		            if(con != null){con.close();}
		         }catch(Exception e1){}
		      }//finally
		      
		      return edto;
		   }//getArticle() end
	
}
