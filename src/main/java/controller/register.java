package controller;
import java.io.IOException;  

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.io.File;
import java.io.FileInputStream;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.registration;

@WebServlet(name = "register", urlPatterns = {"/register"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 10, 
maxRequestSize = 1024 * 1024 * 100,
location="D:\\event-profilepics\\")
public class register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // type of the response sent to the client or browser
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        registration reg = new registration(session);
        try {
            if (request.getParameter("register") != null) {

                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String pw = request.getParameter("pw");
                String cp = request.getParameter("cp");
                String question=request.getParameter("question");
                String answer=request.getParameter("answer");
//                Part filePart= request.getPart("ppic");
//                InputStream inputStream=null;
//                if (filePart != null) {
//                	inputStream= filePart.getInputStream();
//                }
//                String imgloc=request.getParameter("ppic");
//                System.out.println(imgloc);
//                File f=new File(imgloc);
//                FileInputStream fis=new FileInputStream(f);

                if (pw.equals(cp)) {
                    String status = reg.Registration(name, email ,phone, pw,question,answer);
                    
                    
                    if (status.equals("existed")) {

                        request.setAttribute("status", "Existed record");
                        RequestDispatcher rd1 = request.getRequestDispatcher("registration.jsp");
                        rd1.forward(request, response);

                    } else if (status.equals("success")) {
                        request.setAttribute("status", "Successfully Registered");
                        RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                        rd1.forward(request, response);

                    } else if (status.equals("failure")) {
                        request.setAttribute("status", "Registration failed");
                        RequestDispatcher rd1 = request.getRequestDispatcher("registration.jsp");
                        rd1.forward(request, response);

                    }
                }
                
            }
            else if (request.getParameter("login") != null) {
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String status = reg.login(email, pass);
                if (status.equals("success")) {

                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");

                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Login failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                    rd1.forward(request, response);
                }
            } 
            else if (request.getParameter("but") != null) {
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String loc=request.getParameter("loc");
//                System.out.println(loc);
                String status = reg.login(email, pass);
                if (status.equals("success")) {

                    RequestDispatcher rd1 = request.getRequestDispatcher(loc);

                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Login failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                    rd1.forward(request, response);
                }
            } 
            else if (session.getAttribute("uname") != null && request.getParameter("submit") != null) {
                String name = request.getParameter("name");
                String pno = request.getParameter("pno");
                String email = request.getParameter("email");
                registration u = new registration(session);       
                
                String status = u.update(name, pno, email);
                if (status.equals("success")) {
                    request.setAttribute("status", "Profile successfully Updated");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                } else {
                    request.setAttribute("status", "Updation failure");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                }
            }
            else if (request.getParameter("forgotPass") != null) {
                String mail = request.getParameter("email");
                String question = request.getParameter("question");
                String answer = request.getParameter("answer");
                String pw = request.getParameter("pw");
                String cp = request.getParameter("cpw");
                if (pw.equals(cp)) {
                    String status = reg.ForgotPassword(mail, pw, question, answer);
                    if (status.equals("success")) {
                        request.setAttribute("status", "Password Reset Successfully");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                    } else if (status.equals("failure")) {
                        request.setAttribute("status", "Password Reset Failed");
                        RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    request.setAttribute("status", "Password mismatch");
                    RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
                    rd.forward(request, response);
                }
                
            }
            else if (request.getParameter("reset") != null) {
                String eamil = request.getParameter("email");
                String opw = request.getParameter("opw");
                String npw = request.getParameter("npw");
                if (opw.equals(npw)) {
                        request.setAttribute("status", "New Passwordis same as old Password");
                        RequestDispatcher rd = request.getRequestDispatcher("reset.jsp");
                        rd.forward(request, response);
                }
                else {
                	String s = reg.getPassword(eamil, opw);
                	if (s.equals("success")) {
                    String status = reg.resetPassword(eamil, npw);
                     if (status.equals("success")) { 
                        request.setAttribute("status", "Password changed successfully");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                }else {
                    request.setAttribute("status", "Password chang failed");
                    RequestDispatcher rd = request.getRequestDispatcher("reset.jsp");
                    rd.forward(request, response);
                	}
                }
                	else {
                        request.setAttribute("status", "Account not found");
                        RequestDispatcher rd = request.getRequestDispatcher("reset.jsp");
                        rd.forward(request, response);
                }
                }
            }
//            else if (request.getParameter("bookevent") != null) {
//                String eventname = request.getParameter("eventname");
//                String date = request.getParameter("date");
////                System.out.println(date);
////                Date d1=date.pa
//                String status = reg.bookevent(eventname, date);
//                if (status.equals("success")) {
//
//                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
//
//                    rd1.forward(request, response);
//
//                } else if (status.equals("failure")) {
//                    request.setAttribute("status", "Login failed");
//                    RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
//                    rd1.forward(request, response);
//                }
//            }
            else if (request.getParameter("contactme") != null) {
            	String mail = request.getParameter("email");
                String name = request.getParameter("name");
                String phno = request.getParameter("phno");
                String subject = request.getParameter("subject");
                String message = request.getParameter("message");
//                System.out.println(date);
//                Date d1=date.pa
                String status = reg.contact(name,mail,phno,subject,message);
                if (status.equals("success")) {
                	request.setAttribute("status", "Thank you for request soon our partner will call you.");
                    RequestDispatcher rd1 = request.getRequestDispatcher("landing.jsp");

                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Unable to book a call please try again.");
                    RequestDispatcher rd1 = request.getRequestDispatcher("landing.jsp");
                    rd1.forward(request, response);
                }
            }
            else if (request.getParameter("statuseveacc") != null) {
            	String event_id = request.getParameter("event_id");
            	String statuseve = "Accepted";
                String status = reg.updateeventsta(event_id,statuseve);
                if (status.equals("success")) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("requestedevents.jsp");

                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "event status unable to update");
                    RequestDispatcher rd1 = request.getRequestDispatcher("requestedevents.jsp");
                    rd1.forward(request, response);
                }
            }
            else if (request.getParameter("statusevecan") != null) {
            	String event_id = request.getParameter("event_id");
            	String statuseve = "Cancelled";
                String status = reg.updateeventsta(event_id,statuseve);
                if (status.equals("success")) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("EventHistory.jsp");

                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "event status unable to update");
                    RequestDispatcher rd1 = request.getRequestDispatcher("EventHistory.jsp");
                    rd1.forward(request, response);
                }
            }
            else if (request.getParameter("statuseverej") != null) {
            	String event_id = request.getParameter("event_id");
            	String statuseve = "Not Accepted";
                String status = reg.updateeventsta(event_id,statuseve);
                if (status.equals("success")) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("requestedevents.jsp");

                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "event status unable to update");
                    RequestDispatcher rd1 = request.getRequestDispatcher("requestedevents.jsp");
                    rd1.forward(request, response);
                }
            }
            
            else if (request.getParameter("logout") != null) {
                session.invalidate();
                RequestDispatcher rd1 = request.getRequestDispatcher("landing.jsp");
                rd1.forward(request, response);
            }
            else if (request.getParameter("addevent") != null) {
				String img = request.getParameter("image");
				String name = request.getParameter("name");
				String cost = request.getParameter("cost");
				String details = request.getParameter("details");
				String category = request.getParameter("category");
				String status = reg.addEvent(img, name, cost, details, category);
				if (status.equals("Submitted")) {
					request.setAttribute("status", "New Event Added");
					RequestDispatcher rd = request.getRequestDispatcher("adddeleteevent.jsp");
					rd.forward(request, response);
				} else if (status.equals("Already Added")) {
					request.setAttribute("status", "Already Added");
					RequestDispatcher rd = request.getRequestDispatcher("adddeleteevent.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed To Add Event");
					RequestDispatcher rd = request.getRequestDispatcher("adddeleteevent.jsp");
					rd.forward(request, response);
				}
			}

			else if (request.getParameter("delevent") != null) {
				String category = request.getParameter("ecategory");
				String status = reg.delEvent(category);
				if (status.equals("success")) {
					request.setAttribute("status", "Event Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("adddeleteevent.jsp");
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Event Category doesn't exist");
					RequestDispatcher rd = request.getRequestDispatcher("adddeleteevent.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Event");
					RequestDispatcher rd = request.getRequestDispatcher("adddeleteevent.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("addloc") != null) {
				String name = request.getParameter("phname");
				String add = request.getParameter("phadd");
				String status = reg.addLoc(name,add);
				if (status.equals("Submitted")) {
					request.setAttribute("status", "New Location Added");
					RequestDispatcher rd = request.getRequestDispatcher("adddelloc.jsp");
					rd.forward(request, response);
				} else if (status.equals("Already Added")) {
					request.setAttribute("status", "Already Added");
					RequestDispatcher rd = request.getRequestDispatcher("adddelloc.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed To Add Location");
					RequestDispatcher rd = request.getRequestDispatcher("adddelloc.jsp");
					rd.forward(request, response);
				}
			}

			else if (request.getParameter("delloc") != null) {
				String rphname = request.getParameter("rphname");
				String status = reg.delLoc(rphname);
				if (status.equals("success")) {
					request.setAttribute("status", "Location Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("adddelloc.jsp");
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Location doesn't exist");
					RequestDispatcher rd = request.getRequestDispatcher("adddelloc.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Location");
					RequestDispatcher rd = request.getRequestDispatcher("adddelloc.jsp");
					rd.forward(request, response);
				}
			}
			else if (session.getAttribute("uname") != null && request.getParameter("bookevent1") != null) {
				String ename=request.getParameter("ename");
				String edate=request.getParameter("edate");
				String address=request.getParameter("address");
                String status = reg.bookevent(ename,edate,address);
                if (status.equals("success")) {
                    request.setAttribute("status", "Booking successful");
                    RequestDispatcher rd = request.getRequestDispatcher("EventHistory.jsp");
                    rd.forward(request, response);
                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Booking failed");
                    RequestDispatcher rd = request.getRequestDispatcher("eventbooking.jsp");
                    rd.forward(request, response);
                } else if (status.equals("existed")) {
                    request.setAttribute("status", "Party Hall Already Booked For Partycular Date");
                    RequestDispatcher rd = request.getRequestDispatcher("eventbooking.jsp");
                    rd.forward(request, response);
                }
            }


else if (session.getAttribute("name") != null && request.getParameter("cancelevent") != null) {
                int event_id = Integer.parseInt(request.getParameter("event_id"));
                int status = reg.deleteevent(event_id);
                if (status > 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("adddeleteevent.jsp");
                    rd.forward(request, response);
                }
            }
else if (request.getParameter("feedbackbtn") != null) {
	String event_id = request.getParameter("event_id");
	String rating = request.getParameter("rating");
	String feedback = request.getParameter("feedback");
    String status = reg.updateeventfeed(event_id,rating,feedback);
    if (status.equals("success")) {
    	request.setAttribute("status", "feedback submitted");
        RequestDispatcher rd1 = request.getRequestDispatcher("EventHistory.jsp");

        rd1.forward(request, response);

    } else if (status.equals("failure")) {
        request.setAttribute("status", "unable to send feedback try again!!");
        RequestDispatcher rd1 = request.getRequestDispatcher("EventHistory.jsp");
        rd1.forward(request, response);
    }
}


        }
         catch (Exception e) {
            e.printStackTrace();
        }
        

    }

   
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    public String getServletInfo() {
        return "Short description";
    }

}
