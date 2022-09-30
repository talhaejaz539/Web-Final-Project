package MyPack;

import MyPack.PersonInfo;
import java.util.*;
import java.sql.*;

public class PersonDAO {

    private Connection con;
    PreparedStatement pStmt;

    public PersonDAO() throws ClassNotFoundException, SQLException {
        establishConnection();
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/project";
        con = DriverManager.getConnection(url, "root", "root");
    }

    public int addPerson(PersonInfo person) throws SQLException {

        int rs = 0;

        String sql = "INSERT INTO login(name, email, username, password, usertype, status) VALUES(?, ?, ?, ?, ?, ?)";
        pStmt = con.prepareStatement(sql);
        pStmt.setString(1, person.getName());
        pStmt.setString(2, person.getEmail());
        pStmt.setString(3, person.getUsername());
        pStmt.setString(4, person.getPassword());
        pStmt.setString(5, person.getUsertype());
        pStmt.setString(6, person.getStatus());

        rs = pStmt.executeUpdate();

        con.close();

        return rs;
    }

    public PersonInfo login(String username, String password, String usertype) throws SQLException {
        PersonInfo person = null;

        String sql = "SELECT * FROM login WHERE (username = ? AND password = ? AND usertype = ? AND status = ?)";
        pStmt = con.prepareStatement(sql);
        pStmt.setString(1, username);
        pStmt.setString(2, password);
        pStmt.setString(3, usertype);
        pStmt.setString(4, "Active");

        ResultSet rs = pStmt.executeQuery();
        if (rs.next()) {
            String name = rs.getString(2);
            String email = rs.getString(3);
            String userN = rs.getString(4);
            String utype = rs.getString(6);
            String status = rs.getString(7);
            person = new PersonInfo();
            person.setName(name);
            person.setEmail(email);
            person.setUsername(userN);
            person.setUsertype(utype);
            person.setStatus(status);
        }

        con.close();

        return person;
    }

    public ArrayList<PersonInfo> showAllPerson() throws SQLException {
        ArrayList<PersonInfo> plist = new ArrayList<>();

        String sql = "SELECT * FROM login";
        pStmt = con.prepareStatement(sql);
        ResultSet rs = pStmt.executeQuery();

        while (rs.next()) {
            String name = rs.getString(2);
            String email = rs.getString(3);
            String userN = rs.getString(4);
            String utype = rs.getString(6);
            String status = rs.getString(7);
            PersonInfo person = new PersonInfo();
            person.setName(name);
            person.setEmail(email);
            person.setUsername(userN);
            person.setUsertype(utype);
            person.setStatus(status);
            plist.add(person);
        }

        con.close();

        return plist;
    }

    public int blockPerson(String email) throws SQLException {

        int rs = 0;

        String ch = "SELECT status FROM login WHERE email = ?";
        pStmt = con.prepareStatement(ch);
        pStmt.setString(1, email);
        ResultSet rst = pStmt.executeQuery();

        if (rst.next()) {
            String status = rst.getString("status");
            String sql = "UPDATE login SET status = ? WHERE email = ?";
            pStmt = con.prepareStatement(sql);
            if (status.equals("Active")) {
                pStmt.setString(1, "Block");
            } else {
                pStmt.setString(1, "Active");
            }
            pStmt.setString(2, email);

            rs = pStmt.executeUpdate();
        }

        con.close();

        return rs;
    }

    public int deletePerson(String email) throws SQLException {

        int rs = 0;

        String sql = "DELETE FROM login WHERE email = ?";
        pStmt = con.prepareStatement(sql);
        pStmt.setString(1, email);

        rs = pStmt.executeUpdate();

        con.close();

        return rs;
    }

}