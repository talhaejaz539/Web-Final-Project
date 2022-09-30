package MyPack;

import java.io.*;

public class PersonInfo implements Serializable {
    private String name;
    private String email;
    private String username;
    private String password;
    private String usertype;
    private String status;

    public PersonInfo() {
    }

    // Getters
    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getUsertype() {
        return usertype;
    }

    public String getStatus() {
        return status;
    }

    // Setters
    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String toString() {
        return "Name: " + name + "\nEmail: " + email + "\nUsername: " + username + "\nUserType: " + usertype
                + "\nStatus: " + status;
    }
}
