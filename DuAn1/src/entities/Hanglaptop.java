package entities;
// Generated Nov 20, 2019 8:29:19 AM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Hanglaptop generated by hbm2java
 */
public class Hanglaptop  implements java.io.Serializable {


     private Serializable mahang;
     private Serializable tenhang;
     private Set laptops = new HashSet(0);

    public Hanglaptop() {
    }

	
    public Hanglaptop(Serializable mahang) {
        this.mahang = mahang;
    }
    public Hanglaptop(Serializable mahang, Serializable tenhang, Set laptops) {
       this.mahang = mahang;
       this.tenhang = tenhang;
       this.laptops = laptops;
    }
   
    public Serializable getMahang() {
        return this.mahang;
    }
    
    public void setMahang(Serializable mahang) {
        this.mahang = mahang;
    }
    public Serializable getTenhang() {
        return this.tenhang;
    }
    
    public void setTenhang(Serializable tenhang) {
        this.tenhang = tenhang;
    }
    public Set getLaptops() {
        return this.laptops;
    }
    
    public void setLaptops(Set laptops) {
        this.laptops = laptops;
    }




}


