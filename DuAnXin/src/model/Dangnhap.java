package model;
// Generated Nov 25, 2019 8:40:32 AM by Hibernate Tools 4.3.1



/**
 * Dangnhap generated by hbm2java
 */
public class Dangnhap  implements java.io.Serializable {


     private String username;
     private Nhanvien nhanvien;
     private String passwords;
     private String chucvu;

    public Dangnhap() {
    }

	
    public Dangnhap(Nhanvien nhanvien) {
        this.nhanvien = nhanvien;
    }
    public Dangnhap(Nhanvien nhanvien, String passwords, String chucvu) {
       this.nhanvien = nhanvien;
       this.passwords = passwords;
       this.chucvu = chucvu;
    }
   
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public Nhanvien getNhanvien() {
        return this.nhanvien;
    }
    
    public void setNhanvien(Nhanvien nhanvien) {
        this.nhanvien = nhanvien;
    }
    public String getPasswords() {
        return this.passwords;
    }
    
    public void setPasswords(String passwords) {
        this.passwords = passwords;
    }
    public String getChucvu() {
        return this.chucvu;
    }
    
    public void setChucvu(String chucvu) {
        this.chucvu = chucvu;
    }




}

