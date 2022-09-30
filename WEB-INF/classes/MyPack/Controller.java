package MyPack;

import MyPack.PersonInfo;
import MyPack.PersonDAO;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Controller extends HttpServlet {

    // Handles the HTTP GET method.
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Handles the HTTP POST method
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            PersonDAO personDAO = new PersonDAO();
            RoomDAO roomDAO = new RoomDAO();
            ReservationDAO reservationDAO = new ReservationDAO();

            // System.out.println("Action " + request.getParameter("action"));
            if (request.getParameter("action").equals("Login")) {

                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String usertype = request.getParameter("usertype");

                PersonInfo person = personDAO.login(username, password, usertype);

                if (person != null) {
                    String usr = person.getUsertype();
                    request.getSession().setAttribute("name", person.getName());

                    if (usr.equals("Admin")) {
                        request.getSession().setAttribute("usertype", 0);
                        response.sendRedirect("admin.jsp");

                    } else if (usr.equals("Receptionist")) {
                        request.getSession().setAttribute("usertype", 1);
                        response.sendRedirect("receptionist.jsp");

                    }
                } else {
                    String message = "Incorrect username or password or usertype";
                    request.getSession().setAttribute("errMessage", message);
                    response.sendRedirect("login.jsp");
                }

            }

            else if (request.getParameter("action").equals("Logout")) {

                request.getSession().removeAttribute("name");
                request.getSession().removeAttribute("usertype");
                response.sendRedirect("login.jsp");
            }

            else if (request.getParameter("action").equals("Block")) {

                String email = request.getParameter("email");
                int person = personDAO.blockPerson(email);
                String msg;
                if (person == 1) {
                    msg = "User Blocked | Unblocked!";
                } else {
                    msg = "Error!";
                }
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("auserdetails.jsp");
            }

            else if (request.getParameter("action").equals("Delete")) {

                String email = request.getParameter("email");
                int person = personDAO.deletePerson(email);
                String msgs;
                if (person == 1) {
                    msgs = "User Deleted!";
                } else {
                    msgs = "Error!";
                }
                request.getSession().setAttribute("msgs", msgs);
                response.sendRedirect("auserdetails.jsp");
            }

            else if (request.getParameter("action").equals("SignUp")) {

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String usertype = request.getParameter("usertype");

                PersonInfo persona = new PersonInfo();
                persona.setName(name);
                persona.setEmail(email);
                persona.setUsername(username);
                persona.setPassword(password);
                persona.setUsertype(usertype);
                persona.setStatus("Active");

                int person = personDAO.addPerson(persona);

                if (person == 1) {
                    String message = "User Added!";
                    request.getSession().setAttribute("Message", message);
                    response.sendRedirect("signup.jsp");
                } else {
                    String message = "Error! User is not added!";
                    request.getSession().setAttribute("Message", message);
                    response.sendRedirect("signup.jsp");
                }
            }

            // Rooms CRUD

            else if (request.getParameter("action").equals("AddRoom")) {

                String type = request.getParameter("type");
                String beds = request.getParameter("noofbeds");
                int noofbeds = Integer.parseInt(beds);
                String num = request.getParameter("number");
                int number = Integer.parseInt(num);

                RoomInfo room = new RoomInfo();
                room.setType(type);
                room.setNoofbeds(noofbeds);
                room.setNumber(number);
                room.setStatus("Active");
                room.setAssigned("False");

                int rooma = roomDAO.addRoom(room);

                String rmsg;
                if (rooma == 1) {
                    rmsg = "Room Added!";
                } else {
                    rmsg = "Error! Room is not Added!";
                }
                request.getSession().setAttribute("rmsg", rmsg);
                response.sendRedirect("addroom.jsp");
            }

            else if (request.getParameter("action").equals("EditRoom")) {

                String idd = request.getParameter("id");
                int id = Integer.parseInt(idd);
                String type = request.getParameter("type");
                String beds = request.getParameter("noofbeds");
                int noofbeds = Integer.parseInt(beds);
                String num = request.getParameter("number");
                int number = Integer.parseInt(num);
                String status = request.getParameter("status");

                RoomInfo room = new RoomInfo();
                room.setType(type);
                room.setNoofbeds(noofbeds);
                room.setNumber(number);
                room.setStatus(status);

                int rooma = roomDAO.updateRoom(id, room);

                String umsg;
                if (rooma == 1) {
                    umsg = "Room Updated!";
                } else {
                    umsg = "Error!";
                }
                request.getSession().setAttribute("umsg", umsg);
                response.sendRedirect("roomdetails.jsp");

            }

            else if (request.getParameter("action").equals("DeleteRoom")) {
                String idd = request.getParameter("id");
                int id = Integer.parseInt(idd);

                int room = roomDAO.deleteRoom(id);
                String rsmsgs;
                if (room == 1) {
                    rsmsgs = "Room Deleted!";
                } else {
                    rsmsgs = "Error!";
                }
                request.getSession().setAttribute("rsmsgs", rsmsgs);
                response.sendRedirect("roomdetails.jsp");

            }

            // Reservation CRUD
            else if (request.getParameter("action").equals("AddReservation")) {
                String customername = request.getParameter("customername");
                String idproof = request.getParameter("idproof");
                String contactno = request.getParameter("contactno");
                String type = request.getParameter("type");
                String bedsinroom = request.getParameter("bedsinroom");
                int beds = Integer.parseInt(bedsinroom);

                ReservationInfo reservation = new ReservationInfo();
                reservation.setCustomerName(customername);
                reservation.setIdProof(idproof);
                reservation.setContactno(contactno);

                int reserve = reservationDAO.addReservation(reservation, type, beds);

                String resemsg;
                if (reserve == 1) {
                    resemsg = "Reservation Added!";
                } else {
                    resemsg = "Error! Room is not available!";
                }
                request.getSession().setAttribute("resemsg", resemsg);
                response.sendRedirect("addreservation.jsp");

            }

            else if (request.getParameter("action").equals("EditReserve")) {
                String idd = request.getParameter("id");
                int id = Integer.parseInt(idd);
                String customername = request.getParameter("customername");
                String idproof = request.getParameter("idproof");
                String contactno = request.getParameter("contactno");

                ReservationInfo reservation = new ReservationInfo();
                reservation.setId(id);
                reservation.setCustomerName(customername);
                reservation.setIdProof(idproof);
                reservation.setContactno(contactno);

                int reserve = reservationDAO.updateReservation(reservation);

                String rserveupdatemsgs;
                if (reserve == 1) {
                    rserveupdatemsgs = "Reservation Updated!";
                } else {
                    rserveupdatemsgs = "Error!";
                }
                request.getSession().setAttribute("rserveupdatemsgs", rserveupdatemsgs);
                response.sendRedirect("reservationdetails.jsp");
            }

            else if (request.getParameter("action").equals("BlockReserve")) {

                String idd = request.getParameter("id");
                int id = Integer.parseInt(idd);

                int reservation = reservationDAO.blockReservation(id);
                String blockmsgss;
                if (reservation == 1) {
                    blockmsgss = "Reservation Blocked | Unblocked!";
                } else {
                    blockmsgss = "Error!";
                }
                request.getSession().setAttribute("blockmsgss", blockmsgss);
                response.sendRedirect("areservation.jsp");
            }

            else if (request.getParameter("action").equals("DeleteReserve")) {

                String idd = request.getParameter("id");
                int id = Integer.parseInt(idd);

                int reservation = reservationDAO.deleteReservation(id);
                String deletenmsgssss;
                if (reservation == 1) {
                    deletenmsgssss = "Reservation Deleted!";
                } else {
                    deletenmsgssss = "Error!";
                }
                request.getSession().setAttribute("deletenmsgssss", deletenmsgssss);
                response.sendRedirect("areservation.jsp");
            }

            else if (request.getParameter("action").equals("DeleteReservation")) {

                String idd = request.getParameter("id");
                int id = Integer.parseInt(idd);

                int reservation = reservationDAO.deleteReservation(id);
                String deletenmsgssssrser;
                if (reservation == 1) {
                    deletenmsgssssrser = "Reservation Deleted!";
                } else {
                    deletenmsgssssrser = "Error!";
                }
                request.getSession().setAttribute("deletenmsgssssrser", deletenmsgssssrser);
                response.sendRedirect("reservationdetails.jsp");
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }

    }

}
