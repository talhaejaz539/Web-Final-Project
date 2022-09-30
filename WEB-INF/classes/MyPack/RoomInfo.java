package MyPack;

import java.io.*;

public class RoomInfo implements Serializable {
    private int id;
    private String type;
    private int noofbeds;
    private int number;
    private String status;
    private String assigned;

    public RoomInfo() {

    }

    // Getters
    public int getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public int getNoofbeds() {
        return noofbeds;
    }

    public int getNumber() {
        return number;
    }

    public String getStatus() {
        return status;
    }

    public String getAssigned() {
        return assigned;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setNoofbeds(int noofbeds) {
        this.noofbeds = noofbeds;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAssigned(String assigned) {
        this.assigned = assigned;
    }

    public String toString() {
        return "Room Type: " + type + "\nNo of Beds in Room: " + noofbeds + "\nRoom Number: " + number
                + "\nRoom Status: " + status;
    }
}
