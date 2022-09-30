package MyPack;

import MyPack.ReservationInfo;
import java.util.*;
import java.sql.*;

public class ReservationDAO {

    private Connection con;
    PreparedStatement pStmt;

    public ReservationDAO() throws ClassNotFoundException, SQLException {
        establishConnection();
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/project";
        con = DriverManager.getConnection(url, "root", "root");
    }

    public int addReservation(ReservationInfo reservation, String type, int noofbeds) throws SQLException {

        int rs = 0;
        int frs = 0;

        String sql1 = "SELECT * FROM room WHERE (type = ? AND status = ? AND assigned = ? AND noofbeds = ?)";
        pStmt = con.prepareStatement(sql1);
        pStmt.setString(1, type);
        pStmt.setString(2, "Active");
        pStmt.setString(3, "False");
        pStmt.setInt(4, noofbeds);
        ResultSet result = pStmt.executeQuery();

        if (result.next()) {
            int roomid = result.getInt(1);
            String sql = "INSERT INTO reservation(customername, idproof, contactno, status, roomid) VALUES (?, ?, ?, ?, ?)";
            pStmt = con.prepareStatement(sql);
            pStmt.setString(1, reservation.getCustomerName());
            pStmt.setString(2, reservation.getIdProof());
            pStmt.setString(3, reservation.getContactno());
            pStmt.setString(4, "Active");
            pStmt.setInt(5, roomid);

            rs = pStmt.executeUpdate();

            if (rs == 1) {
                String sql2 = "UPDATE room SET assigned = ? WHERE id = ?";
                pStmt = con.prepareStatement(sql2);
                pStmt.setString(1, "True");
                pStmt.setInt(2, roomid);

                frs = pStmt.executeUpdate();
            }
        }

        con.close();

        return frs;

    }

    public ArrayList<ReservationInfo> showAllReservations() throws SQLException {
        ArrayList<ReservationInfo> rlist = new ArrayList<>();

        String sql = "SELECT * FROM reservation";
        pStmt = con.prepareStatement(sql);
        ResultSet rs = pStmt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt(1);
            String customername = rs.getString(2);
            String idproof = rs.getString(3);
            String contactno = rs.getString(4);
            String status = rs.getString(5);
            int roomid = rs.getInt(6);

            String sql1 = "SELECT number FROM room WHERE id = ?";
            pStmt = con.prepareStatement(sql1);
            pStmt.setInt(1, roomid);

            ResultSet res = pStmt.executeQuery();

            int roomnumber = 0;
            if (res.next()) {
                roomnumber = res.getInt(1);
            }

            ReservationInfo reservation = new ReservationInfo();
            reservation.setId(id);
            reservation.setCustomerName(customername);
            reservation.setIdProof(idproof);
            reservation.setContactno(contactno);
            reservation.setStatus(status);
            reservation.setRoomNumber(roomnumber);
            rlist.add(reservation);

        }

        con.close();

        return rlist;
    }

    public int updateReservation(ReservationInfo reservation) throws SQLException {
        int rs = 0;

        String sql = "UPDATE reservation SET customername = ?, idproof = ?, contactno = ? WHERE id= ?";
        pStmt = con.prepareStatement(sql);
        pStmt.setString(1, reservation.getCustomerName());
        pStmt.setString(2, reservation.getIdProof());
        pStmt.setString(3, reservation.getContactno());
        pStmt.setInt(4, reservation.getId());

        rs = pStmt.executeUpdate();

        return rs;
    }

    public int blockReservation(int id) throws SQLException {

        int rs = 0;

        String ch = "SELECT status FROM reservation WHERE id = ?";
        pStmt = con.prepareStatement(ch);
        pStmt.setInt(1, id);
        ResultSet rst = pStmt.executeQuery();

        if (rst.next()) {
            String status = rst.getString("status");
            String sql = "UPDATE reservation SET status = ? WHERE id = ?";
            pStmt = con.prepareStatement(sql);
            if (status.equals("Active")) {
                pStmt.setString(1, "Block");
            } else {
                pStmt.setString(1, "Active");
            }
            pStmt.setInt(2, id);

            rs = pStmt.executeUpdate();
        }

        con.close();

        return rs;
    }

    public int deleteReservation(int id) throws SQLException {

        int rs = 0;

        String sql2 = "SELECT roomid FROM reservation WHERE id = ?";
        pStmt = con.prepareStatement(sql2);
        pStmt.setInt(1, id);
        ResultSet res = pStmt.executeQuery();

        int roomid = 0;
        if (res.next()) {
            roomid = res.getInt(1);
            String sql1 = "UPDATE room SET assigned = ? WHERE id = ?";
            pStmt = con.prepareStatement(sql1);
            pStmt.setString(1, "False");
            pStmt.setInt(2, roomid);
            int result = pStmt.executeUpdate();

            if (result == 1) {
                String sql = "DELETE FROM reservation WHERE id = ?";
                pStmt = con.prepareStatement(sql);
                pStmt.setInt(1, id);

                rs = pStmt.executeUpdate();
            }
        }

        con.close();

        return rs;
    }

}
