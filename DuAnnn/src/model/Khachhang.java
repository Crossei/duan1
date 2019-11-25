package model;
// Generated Nov 21, 2019 2:59:47 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Khachhang generated by hbm2java
 */
public class Khachhang  implements java.io.Serializable {


     private String makh;
     private String tenkh;
     private String dienthoai;
     private Set<Hoadon> hoadons = new HashSet<Hoadon>(0);

    public Khachhang() {
    }

	
    public Khachhang(String makh) {
        this.makh = makh;
    }
    public Khachhang(String makh, String tenkh, String dienthoai, Set<Hoadon> hoadons) {
       this.makh = makh;
       this.tenkh = tenkh;
       this.dienthoai = dienthoai;
       this.hoadons = hoadons;
    }
   
    public String getMakh() {
        return this.makh;
    }
    
    public void setMakh(String makh) {
        this.makh = makh;
    }
    public String getTenkh() {
        return this.tenkh;
    }
    
    public void setTenkh(String tenkh) {
        this.tenkh = tenkh;
    }
    public String getDienthoai() {
        return this.dienthoai;
    }
    
    public void setDienthoai(String dienthoai) {
        this.dienthoai = dienthoai;
    }
    public Set<Hoadon> getHoadons() {
        return this.hoadons;
    }
    
    public void setHoadons(Set<Hoadon> hoadons) {
        this.hoadons = hoadons;
    }




}

