package model;

import java.io.FileInputStream;  

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.event;
import model.user;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class registration {
	private Connection con;
    HttpSession se;

    public registration(HttpSession session) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "tiger");
            // connection with data base
            se = session;
            PreparedStatement ps = con.prepareStatement("update events set status ='Completed' where  date<now()and status='Accepted'");
            int a=ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String Registration(String name, String email, String phone, String pw,String question,String answer) {
    	
        PreparedStatement ps;
        String status = "";
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("select * from account where phone='" + phone + "' or email='" + email + "';");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
                ps = (PreparedStatement) con.prepareStatement("insert into account(id,name,email,phone,password,question,answer,date) values(0,?,?,?,?,?,?,now())");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, pw);
                ps.setString(5, question);
                ps.setString(6, answer);
//                if(ppic!=null) {
//                ps.setBlob(7, ppic);
//                }
//                ps.setBinaryStream(7, fis);
                int a = ps.executeUpdate();
                if (a > 0) {
                    status = "success";
                } else {
                    status = "failure";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public String login(String email, String pass) {
        String status1 = "", id = "";
        String name = "", emails = "",phone;

        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();

            rs = st.executeQuery("select * from account where email='" + email + "' and password='" + pass + "';");
            boolean b = rs.next();
            if (b == true) {
                id = rs.getString("id");
                name = rs.getString("name");
                emails = rs.getString("email");
                phone = rs.getString("phone");
                se.setAttribute("uname", name);
                se.setAttribute("email", emails);
                se.setAttribute("phone", phone);
                se.setAttribute("id", id);
                status1 = "success";
            } else {
                status1 = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status1;
    }
    public user getInfo() {
        Statement st = null;
        ResultSet rs = null;
        user s = new user();
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from account where id= '" + se.getAttribute("id") + "'");
            boolean b = rs.next();
            if (b == true) {
                s = new user();
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }
    public String update(String name, String pno, String email) {
        String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
//            st = con.createStatement();
//            st.executeUpdate("update account set name='" + name + "',phone='" + pno + "',email='" + email + "' where id= '" + se.getAttribute("id") + "' ");
//            se.setAttribute("uname", name);
//            se.setAttribute("email", email);
        	st = con.createStatement();
        	int res=st.executeUpdate("update account set name='"+name+"',email='"+email+"',phone='"+pno+"' where id="+se.getAttribute("id")+";");
             if(res>0) {
            	 status = "success";
            	 se.setAttribute("uname", name);
            	 se.setAttribute("email", email);
            	 se.setAttribute("phone", pno);
             }
             else {
            	 status = "failure";
             }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public String ForgotPassword(String mail, String pw, String question, String answer) {
        String status = "";
        try {
            Statement st = con.createStatement();

            int rspw = st.executeUpdate("update account  set password='" + pw + "' where email='" + mail + "'and question='" + question + "'and answer='" + answer + "';");
            if (rspw > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public String getPassword(String email,String oldPass) {
    	// TODO Auto-generated method stub
    	       String status = "";
    	       PreparedStatement ps = null;
    	       ResultSet rs = null;
    	       String query = "select * from account where email=? and password=?";
    	       try {
    	           ps = con.prepareStatement(query);
    	           ps.setString(1, email);
    	           ps.setString(2, oldPass);
    	           rs = ps.executeQuery();
    	           if (rs.next()) {
    	               //se.setAttribute("pwd", rs.getString(5));
    	               status = "success";
    	           } else {
    	               status = "failed";
    	           }
    	       } catch (SQLException e) {
    	           e.printStackTrace();
    	       }
    	       //System.out.println(status);
    	       return status;
    	   }
    public String resetPassword(String email, String pwd) {
    	// TODO Auto-generated method stub
    	       String status = "";
    	       PreparedStatement ps = null;
    	       boolean res;
    	       try {
    	           ps = con.prepareStatement("update account set password =  ? where  email =  ?");
    	           ps.setString(1, pwd);
    	           ps.setString(2, email);
    	           int rc = ps.executeUpdate();
    	           if (rc > 0) {
    	               status = "success";
    	           } else {
    	               status = "failed";
    	           }
    	       } catch (SQLException e) {
    	// TODO Auto-generated catch block
    	           e.printStackTrace();
    	       }
    	       return status;
    	   }

	public String bookevent(String eventname, String date,String loc_id) {
		
		PreparedStatement ps;
        String status = "";
        try {
            ResultSet rs = null;
            Statement st = con.createStatement();
          rs = st.executeQuery("select event_id from events where date= '" + date + "' and loc_id="+loc_id);
          boolean b = rs.next();
          if (b == true) {
              status = "existed";
          } else {
            st = con.createStatement();
                ps = con.prepareStatement("insert into events(event_id,event_name,host_id,date,loc_id) values(0,?,?,?,?)");
                ps.setString(1, eventname);
                ps.setString(2, (String) se.getAttribute("id"));
                ps.setString(3, date);
                ps.setString(4, loc_id);
                int a = ps.executeUpdate();
                if (a > 0) {
                    status = "success";
                } else {
                    status = "failure";
                }
          }

        } catch (Exception e) {
            e.printStackTrace();
        }
		return status;
	}

	public String contact(String name, String mail, String phno, String subject, String message) {
		PreparedStatement ps;
        String status = "";
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
                ps = (PreparedStatement) con.prepareStatement("insert into contactus values(?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, mail);
                ps.setString(3, phno);
                ps.setString(4, subject);
                ps.setString(5, message);
                int a = ps.executeUpdate();
                if (a > 0) {
                    status = "success";
                } else {
                    status = "failure";
                }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
		return status;
	}
	public ArrayList<event> geteventinfo() {
    	Statement st = null;
    	ResultSet rs = null;
    	ArrayList<event> al = new ArrayList<event>();
    	try {
    	st = con.createStatement();
    	String qry = "select * from events where host_id = '" + se.getAttribute("id") + "';";
    	rs = st.executeQuery(qry);
    	while (rs.next()) {
    	event p = new event();
    	registration c=new registration(se);
    	p.setEvent_id(rs.getString("event_id"));
    	p.setEvent_name(rs.getString("event_name"));
    	p.setHost_id(rs.getString("host_id"));
    	p.setDate(rs.getString("date"));
    	p.setStatus(rs.getString("status"));
    	p.setRating(rs.getString("rating"));
    	p.setFeedback(rs.getString("feedback"));;
    	p.setLoc_name(c.getlocname(rs.getString("loc_id")));
    	al.add(p);
    	}
    	} catch (Exception e) {
    	e.printStackTrace();
    	}
    	return al;
    }
	public ArrayList<location> getlocinfo() {
    	Statement st = null;
    	ResultSet rs = null;
    	ArrayList<location> al = new ArrayList<location>();
    	try {
    	st = con.createStatement();
    	String qry = "select * from location ;";
    	rs = st.executeQuery(qry);
    	while (rs.next()) {
    	location p = new location();
    	p.setLoc_id(rs.getString("loc_id"));
    	p.setPhname(rs.getString("partyhall_name"));
    	p.setPhadd(rs.getString("partyhall_address"));
    	
    	al.add(p);
    	}
    	} catch (Exception e) {
    	e.printStackTrace();
    	}
    	return al;
    }
	public ArrayList<event> requested_event() {
    	Statement st = null;
    	ResultSet rs = null;
    	ArrayList<event> al = new ArrayList<event>();
    	try {
    	st = con.createStatement();
    	String qry = "select * from events where status = 'Not Yet Approved' and date>now()	;";
    	rs = st.executeQuery(qry);
    	while (rs.next()) {
    	event p = new event();
    	registration ba=new registration(se);
    	p.setClient_name(getclientname(rs.getString("host_id")));
    	p.setEvent_id(rs.getString("event_id"));
    	p.setEvent_name(rs.getString("event_name"));
    	p.setHost_id(rs.getString("host_id"));
    	p.setDate(rs.getString("date"));
    	p.setStatus(rs.getString("status"));
    	al.add(p);
    	}
    	} catch (Exception e) {
    	e.printStackTrace();
    	}
    	return al;
    }

	private String getclientname(String string) {
		// TODO Auto-generated method stub
		String status = "";
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    
	    try {
	        ps = con.prepareStatement("select name from account where id='"+string+"';");
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            //se.setAttribute("pwd", rs.getString(5));
	            return rs.getString("name");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    //System.out.println(status);
	    return status;
		
	}

	public String updateeventsta(String event_id, String statuseve) {
		// TODO Auto-generated method stub
		String status = "";
	       PreparedStatement ps = null;
	       boolean res;
	       try {
	           ps = con.prepareStatement("update events set status =  ? where  event_id =  ?");
	           ps.setString(2, event_id);
	           ps.setString(1, statuseve);
	           int rc = ps.executeUpdate();
	           if (rc > 0) {
	               status = "success";
	           } else {
	               status = "failed";
	           }
	       } catch (SQLException e) {
	// TODO Auto-generated catch block
	           e.printStackTrace();
	       }
	       return status;
	}
	public ArrayList<event> getongoingevent() {
    	Statement st = null;
    	ResultSet rs = null;
    	ArrayList<event> al = new ArrayList<event>();
    	try {
    	st = con.createStatement();
    	String qry = "select * from events where status = 'Accepted' and date>now();";
    	rs = st.executeQuery(qry);
    	while (rs.next()) {
    	event p = new event();
    	p.setEvent_id(rs.getString("event_id"));
    	p.setEvent_name(rs.getString("event_name"));
    	p.setHost_id(rs.getString("host_id"));
    	p.setDate(rs.getString("date"));
    	p.setStatus(rs.getString("status"));
    	al.add(p);
    	}
    	} catch (Exception e) {
    	e.printStackTrace();
    	}
    	return al;
    }
	public ArrayList<event> getcompletedevent() {
    	Statement st = null;
    	ResultSet rs = null;
    	ArrayList<event> al = new ArrayList<event>();
    	try {
    	st = con.createStatement();
    	String qry = "select * from events where status != 'Not Yet Approved';";
    	rs = st.executeQuery(qry);
    	while (rs.next()) {
    	event p = new event();
    	p.setEvent_id(rs.getString("event_id"));
    	p.setEvent_name(rs.getString("event_name"));
    	p.setHost_id(rs.getString("host_id"));
    	p.setDate(rs.getString("date"));
    	p.setStatus(rs.getString("status"));
    	al.add(p);
    	}
    	} catch (Exception e) {
    	e.printStackTrace();
    	}
    	return al;
    }
	public ArrayList<event> get_eventinfo(String event_category) {
        ArrayList<event> al = new ArrayList<event>();
        try {
        	ResultSet rs = null;
        	Statement st = null;
        	st = con.createStatement();
        	rs = st.executeQuery(" select * from events1 where event_categories='"+event_category+"';");
        	while (rs.next()) {
        		event d = new event();
        	d.setEvent_img(rs.getString("event_image"));
        	d.setEvent_id(rs.getString("event_id"));
        	d.setEvent_name(rs.getString("event_name"));
        	d.setEvent_category(rs.getString("event_categories"));
        	d.setEvent_cost(rs.getString("event_cost"));
        	d.setEvent_details(rs.getString("event_details"));
        	al.add(d);
        	}

        } catch (Exception e) {
            e.printStackTrace();
        }

        return al;

    }
	public ArrayList<client> requested_call() {
        ArrayList<client> al = new ArrayList<client>();
        try {
        	ResultSet rs = null;
        	Statement st = null;
        	st = con.createStatement();
        	rs = st.executeQuery(" select * from contactus;");
        	while (rs.next()) {
        		client d = new client();
        	d.setName(rs.getString("name"));
        	d.setEmail(rs.getString("email"));
        	d.setPhone(rs.getString("phno"));
        	d.setSubject(rs.getString("subject"));
        	d.setMessage(rs.getString("message"));
        	al.add(d);
        	}

        } catch (Exception e) {
            e.printStackTrace();
        }

        return al;

    }
	public event getEventFormInfo(String event_id) {
        Statement st = null;
        ResultSet rs = null;
        event s = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from events1 where event_id= '" + event_id + "'");
            boolean b = rs.next();
            if (b == true) {
                s = new event();
                s.setEvent_name(rs.getString("event_name"));
                s.setEvent_cost(rs.getString("event_cost"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }
//	public String Booknow(HttpServletRequest request) {
//        String status = "";
//        ResultSet rs = null;
//        try {
//            Statement st = con.createStatement();
//            rs = st.executeQuery("select event_id from event where eventdate= '" + request.getParameter("edate") + "'");
//            boolean b = rs.next();
//            if (b == true) {
//                status = "existed";
//            } else {
////                String qry = "insert into bookevent select 0,event_image,event_name,'" + request.getParameter("pno") + "', '" + request.getParameter("email") + "','" + request.getParameter("address") + "',event_cost,'" + se.getAttribute("name") + "'," + se.getAttribute("id") + " ,'pending',now(),'" + request.getParameter("edate") + "' from events where event_id=" + request.getParameter("event_id") + ";";
//                int a = st.executeUpdate("insert into event values(0,'" + request.getParameter(ename)+ "', '\" ");
//                if (a > 0) {
//                    status = "success";
//                } else {
//                    status = "failure";
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return status;
//    }

public int deleteevent(int event_id) {
        int status = 0;
        try {
            Statement st = null;
            st = con.createStatement();
            String qry = "update bookevent set status='cancelled' where event_id=' " + event_id + "' ";
            status = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

	public String addEvent(String img, String name, String cost, String details, String category) {
	
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from events1 where event_name='" + name + "';");
			boolean b = rs.next();
			if (b)
				status = "Already Added";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into events1 values (0,?,?,?,?,?,now())");
				ps.setString(1, img);
				ps.setString(2, name);
				ps.setString(3, cost);
				ps.setString(4, details);
				ps.setString(5, category);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Submitted";
				else
					status = "Failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String delEvent(String category) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from events1 where " + "event_categories='" + category + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String addLoc(String name, String add) {
		
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from location where partyhall_name='" + name + "';");
			boolean b = rs.next();
			if (b)
				status = "Already Added";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into location values (0,?,?)");
				ps.setString(1, name);
				ps.setString(2, add);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Submitted";
				else
					status = "Failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String delLoc(String category) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from location where partyhall_name='" + category + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
public ArrayList<event> getEventList() {
ArrayList<event> al = new ArrayList<event>();
try {
ResultSet rs = null;
Statement st = null;
st = con.createStatement();
String qry = " select * from events1;";
rs = st.executeQuery(qry);
registration r1=new registration(se);
while (rs.next()) {
	event d = new event();
	
	d.setEvent_name(rs.getString("event_name"));
	String rate=r1.ratingget(d.getEvent_name());
	d.setRating(rate);
	if(d.getRating()==null) {
		d.setRating("0");
	}
//	System.out.println(d.getRating());
d.setEvent_img(rs.getString("event_image"));
d.setEvent_id(rs.getString("event_id"));
d.setEvent_category(rs.getString("event_categories"));
d.setEvent_cost(rs.getString("event_cost"));
d.setEvent_details(rs.getString("event_details"));
al.add(d);
}
} catch (Exception e) {
e.printStackTrace();
}
return al;
}

public String updateeventfeed(String event_id, String rating, String feedback) {
	String status = "";
    PreparedStatement ps = null;
    boolean res;
    try {
        ps = con.prepareStatement("update events set rating =  ? , feedback=? where  event_id =  ?");
        ps.setString(3, event_id);
        ps.setString(1, rating);
        ps.setString(2, feedback);
        int rc = ps.executeUpdate();
        if (rc > 0) {
            status = "success";
        } else {
            status = "failed";
        }
    } catch (SQLException e) {
// TODO Auto-generated catch block
        e.printStackTrace();
    }
    return status;
}
public String ratingget(String evename) {
	String status = "3";
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        ps = con.prepareStatement("select ceil(avg(rating)) rating from events where event_name='"+evename+"';");
        rs = ps.executeQuery();
        if (rs.next()) {
            //se.setAttribute("pwd", rs.getString(5));
            return rs.getString("rating");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    //System.out.println(status);
    return status;
}
public String getlocname(String loc_id) {
	String status = "";
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        ps = con.prepareStatement("select partyhall_name from location where loc_id="+loc_id+";");
        rs = ps.executeQuery();
        if (rs.next()) {
            //se.setAttribute("pwd", rs.getString(5));
            return rs.getString("partyhall_name");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    //System.out.println(status);
    return status;
}

}
