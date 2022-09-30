package MyPack;

import java.io.*;

public class ReservationInfo implements Serializable {

    private int id;
    private String customername;
    private String idproof;
    private String contactno;
    private String status;
    private int roomid;
    private int roomnumber;

    public ReservationInfo() {
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getCustomerName() {
        return customername;
    }

    public String getIdProof() {
        return idproof;
    }

    public String getContactno() {
        return contactno;
    }

    public String getStatus() {
        return status;
    }

    public int getRoomid() {
        return id;
    }

    public int getRoomNumber() {
        return roomnumber;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setCustomerName(String customername) {
        this.customername = customername;
    }

    public void setIdProof(String idproof) {
        this.idproof = idproof;
    }

    public void setContactno(String contactno) {
        this.contactno = contactno;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public void setRoomNumber(int roomnumber) {
        this.roomnumber = roomnumber;
    }

    public String toString() {
        return "Customer Name: " + customername + "\nID Proof: " + idproof + "\nContact No: " + contactno
                + "\nReservation Status: " + status;
    }
}
