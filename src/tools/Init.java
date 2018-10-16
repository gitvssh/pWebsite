package tools;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import boardmysql.BoardDAO;
import boardmysql.BoardDTO;

public class Init {

	private Connection getCon() throws Exception{
		Context ct = new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}// Connection getCon end
	
	public boolean createBoard(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table board("
					+"num int(11) not null primary key auto_increment,"
					+"id varchar(10) not null,"
					+"email varchar(30),"
					+"subject varchar(50) not null,"
					+"regdate Timestamp,"
					+"readcount int(11) default 0,"
					+"ref int(11) not null,"
					+"re_step smallint(6) not null,"
					+"re_level smallint(6) not null,"
					+"content text not null,"
					+"ip varchar(20),"
					+"category int(1)"
					+")");

			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createBoard() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	
	public boolean createMember(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table member("
				+"id varchar(12) not null primary key,"
				+"passwd varchar(64) not null,"
				+"name varchar(20) not null,"
				+"jumin1 varchar(6) not null,"
				+"jumin2 varchar(7) not null,"
				+"email varchar(30),"
				+"zipcode varchar(7),"
				+"addr varchar(50),"
				+"job varchar(30),"
				+"regdate date not null,"
				+"point int(6),"
				+"level int(1) not null"
				+")");
			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createMember() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	
	public boolean createAdmin(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table admin("
					+"id varchar(12) not null primary key,"
					+"passwd varchar(64) not null,"
					+"level int(1) not null"
					+")");
			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createAdmin() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	
	public boolean createEvent(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table event("
					+"event_id int(4) not null primary key,"
					+"event_title varchar(30),"
					+"event_startDate date,"
					+"event_endDate date,"
					+"event_info varchar(4000),"
					+"event_win int(3),"
					+"event_point int(4),"
					+"id varchar(12),"
					+"event_img varchar(10),"
					+"foreign key(id) references admin(id)"
				+")");
			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createEvent() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	
	public boolean createEventApply(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table eventApply("
					+"id varchar(12),"
					+"event_id int(4),"
					+"regdate date,"
					+" foreign key(id) references member(id),"
				+" foreign key(event_id) references event(event_id))");
			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createEventApply() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	
	public boolean createEventWin(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table eventwin("
					+"id varchar(12),"
					+" foreign key(id) references member(id)"
				+")");
			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createEventWin() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	

	public boolean createGenre(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table genre("
					+"genre_id int(2) not null primary key," //장르ID(1~10)
					+"genre_info varchar(300)"// 장르 설명(코미디,등등)
				+")");
			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createGenre() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	
	public boolean createMovieInfo(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table movieinfo("
					+"movie_id int(4) not null primary key,"
					+"genre_id int(2),"
					+"movie_title varchar(30) not null,"
					+"movie_title_eng varchar(40) not null,"
					+"movie_static varchar(50),"
					+"movie_member varchar(50),"
					+"movie_rating varchar(8),"
					+"movie_showtime int(4),"
					+"movie_country varchar(10),"
					+"movie_opendate date,"
					+"foreign key(genre_id) references genre(genre_id)"
				+")");
			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createMovieInfo() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	
	
	public boolean createMovieReview(){
		boolean result=false;
		Connection con= null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("create table moviereview("
					+"movie_id int(4),"// foreign key 영화ID
					+"id varchar(12),"// foreing key 회원ID
					+"review_content varchar(4000),"
					+"review_rating int(3),"
					+"review_date date,"
					+"review_recommend boolean,"
					+ "foreign key(movie_id) references movieinfo(movie_id),"
					+ "foreign key(id) references member(id)"//추천/비추천
				+")");
			pstmt.executeUpdate();
			result=true;
		}catch(Exception ex1){
			System.out.println("createMovieReview() :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		return result;
	}
	
	public boolean insertBoardDummy(){
		boolean result=false;
		
		BoardDAO dao = BoardDAO.getDao();
		BoardDTO dto = new BoardDTO();
		
		try{
		for(int i=1;i<=100;i++){
			dto.setId("테스트");
			dto.setEmail("test@test.com");
			dto.setSubject("테스트 "+i+"번째 글");
			dto.setContent("테스트입니다.");
			dto.setIp("111.111.111.11");
			dto.setCategory(0);
			dao.insertContent(dto);
				
		}//for
		}catch(Exception ex){
			System.out.println("게시판 더미입력 에러");
		}
		return result;
	}
	
	public void createDatabase(){
		if(createBoard()){
			System.out.println("01.Board 생성 성공");
		}else{
			System.out.println("01.Board 생성 실패");
		}
		if(createMember()){
			System.out.println("01.Board 생성 실패");
		}else{
			System.out.println("01.Board 생성 실패");
		}
		if(createEvent()){
			System.out.println("01.Board 생성 실패");
		}else{
			System.out.println("01.Board 생성 실패");
		}
		if(createAdmin()){
			System.out.println("01.Board 생성 실패");
		}else{
			System.out.println("01.Board 생성 실패");
		}
		if(createEventApply()){
			System.out.println("01.Board 생성 실패");
		}else{
			System.out.println("01.Board 생성 실패");
		}
		if(createEventWin()){
			System.out.println("01.Board 생성 실패");
		}else{
			System.out.println("01.Board 생성 실패");
		}
		if(createGenre()){
			System.out.println("01.Board 생성 실패");
		}else{
			System.out.println("01.Board 생성 실패");
		}
		if(createMovieInfo()){
			System.out.println("01.Board 생성 실패");
		}else{
			System.out.println("01.Board 생성 실패");
		}
		if(createMovieReview()){
			System.out.println("01.Board 생성 실패");
		}else{
			System.out.println("01.Board 생성 실패");
		}
	}
}
