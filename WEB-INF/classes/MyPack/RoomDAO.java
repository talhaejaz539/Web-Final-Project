package MyPack;

import MyPack.RoomInfo;
import java.util.*;
import java.sql.*;

public class RoomDAO {

    private Connection con;
    PreparedStatement pStmt;

    public RoomDAO() throws ClassNotFoundException, SQLException {
        establishConnection();
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/project";
        con = DriverManager.getConnection(url, "root", "root");
    }

    public int addRoom(RoomInfo room) throws SQLException {

        int rs = 0;

        String sql = "INSERT INTO room(type, noofbeds, number, status, assigned) VALUES(?, ?, ?, ?, ?)";
        pStmt = con.prepareStatement(sql);
        pStmt.setString(1, room.getType());
        pStmt.setInt(2, room.getNoofbeds());
        pStmt.setInt(3, room.getNumber());
        pStmt.setString(4, room.getStatus());
        pStmt.setString(5, room.getAssigned());

        rs = pStmt.executeUpdate();

        con.close();

        return rs;

    }

    public ArrayList<RoomInfo> showAllRooms() throws SQLException {
        ArrayList<RoomInfo> rlist = new ArrayList<>();

        String sql = "SELECT * FROM room ORDER BY number";
        pStmt = con.prepareStatement(sql);
        ResultSet rs = pStmt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt(1);
            String type = rs.getString(2);
            int noofbeds = rs.getInt(3);
            int number = rs.getInt(4);
            String status = rs.getString(5);
            RoomInfo room = new RoomInfo();
            room.setId(id);
            room.setType(type);
            room.setNoofbeds(noofbeds);
            room.setNumber(number);
            room.setStatus(status);
            rlist.add(room);
        }

        con.close();

        return rlist;
    }

    public int updateRoom(int id, RoomInfo room) throws SQLException {
        int rs = 0;

        String sql = "UPDATE room SET type = ?, noofbeds = ?, number = ?, status = ? WHERE id= ?";
        pStmt = con.prepareStatement(sql);
        pStmt.setString(1, room.getType());
        pStmt.setInt(2, room.getNoofbeds());
        pStmt.setInt(3, room.getNumber());
        pStmt.setString(4, room.getStatus());
        pStmt.setInt(5, id);

        rs = pStmt.executeUpdate();

        return rs;
    }

    public int deleteRoom(int id) throws SQLException {
        int rs = 0;

        String sql = "DELETE FROM room WHERE id = ?";
        pStmt = con.prepareStatement(sql);
        pStmt.setInt(1, id);
        rs = pStmt.executeUpdate();

        con.close();

        return rs;
    }

    public String[] roomtype() throws SQLException {

        String sql = "SELECT distinct type FROM room";
        pStmt = con.prepareStatement(sql);
        ResultSet res = pStmt.executeQuery();

        int rowCount = 0;
        if (res.last()) {
            rowCount = res.getRow();
            res.beforeFirst();
        }

        String[] type = new String[rowCount];

        int i = 0;

        while (res.next() && i < rowCount) {
            type[i++] = res.getString(1);
        }

        return type;
    }

    public int[] bedsinroom() throws SQLException {
        // int[] beds = { 0, 0 };

        String sql = "SELECT distinct noofbeds FROM room";
        pStmt = con.prepareStatement(sql);
        ResultSet res = pStmt.executeQuery();

        int rowCount = 0;
        if (res.last()) {
            rowCount = res.getRow();
            res.beforeFirst();
        }

        int[] beds = new int[rowCount];

        int i = 0;

        while (res.next() && i < rowCount) {
            beds[i++] = res.getInt(1);
        }

        return beds;
    }

    public ArrayList<RoomInfo> roomAvailable() throws SQLException {
        ArrayList<RoomInfo> rlist = new ArrayList<>();

        String sql = "SELECT * FROM room WHERE (assigned = ? AND status = ?)";
        pStmt = con.prepareStatement(sql);
        pStmt.setString(1, "False");
        pStmt.setString(2, "Active");
        ResultSet rs = pStmt.executeQuery();

        while (rs.next()) {
            String type = rs.getString(2);
            int noofbeds = rs.getInt(3);
            int number = rs.getInt(4);

            RoomInfo room = new RoomInfo();
            room.setType(type);
            room.setNoofbeds(noofbeds);
            room.setNumber(number);
            rlist.add(room);
        }

        con.close();

        return rlist;
    }

}
