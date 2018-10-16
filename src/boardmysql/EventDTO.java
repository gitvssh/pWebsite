package boardmysql;
import java.util.*;

public class EventDTO {
	
	private int event_id;
	private String event_title;
	private Date event_startDate;
	private Date event_endDate;
	private String event_info;
	
	private int event_win;
	private int event_point;
	private String event_img;
	private String id;
	
	public EventDTO(){}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public Date getEvent_startDate() {
		return event_startDate;
	}

	public void setEvent_startDate(Date event_startDate) {
		this.event_startDate = event_startDate;
	}

	public Date getEvent_endDate() {
		return event_endDate;
	}

	public void setEvent_endDate(Date event_endDate) {
		this.event_endDate = event_endDate;
	}

	public String getEvent_info() {
		return event_info;
	}

	public void setEvent_info(String event_info) {
		this.event_info = event_info;
	}

	public int getEvent_win() {
		return event_win;
	}

	public void setEvent_win(int event_win) {
		this.event_win = event_win;
	}

	public int getEvent_point() {
		return event_point;
	}

	public void setEvent_point(int event_point) {
		this.event_point = event_point;
	}

	public String getEvent_img() {
		return event_img;
	}

	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	} 
	
}
