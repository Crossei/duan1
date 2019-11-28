/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import model.Khachhang;
import model.Nhanvien;
import org.hibernate.SessionFactory;
import util.NewHibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author ABC
 */
public class NhanvienDAO {

    

    
    private final SessionFactory sf = NewHibernateUtil.getSessionFactory();
    public List<Nhanvien> findAll(){
        try {
            
            sf.getCurrentSession().beginTransaction();
            return sf.getCurrentSession().createCriteria(Nhanvien.class).list();
            
        } catch (Exception e) {
            return null;
        }
    }
    public static List<Nhanvien> ListDanhsach(String manv) {
        List<Nhanvien> list = null;
        Session session = NewHibernateUtil.getSessionFactory().getCurrentSession();
        session.getTransaction().begin();
        String sql = "from Nhanvien";
        if (manv.length() > 0) {
            sql += " " + manv;

        }
        Query query = session.createQuery(sql);
        list = query.list();
       
        return list;

    }
     public  Nhanvien timkiem(String manv) {
         try {
             sf.getCurrentSession().beginTransaction();
        return(Nhanvien) sf.getCurrentSession().get(Nhanvien.class, manv);    
         } catch (Exception e) {
             return null;
         }

    }
     public boolean delete(Nhanvien nv){
         try {
             sf.getCurrentSession().beginTransaction();
             sf.getCurrentSession().delete(nv);
             sf.getCurrentSession().getTransaction().commit();
             return true;
         } catch (Exception e) {
             sf.getCurrentSession().getTransaction().rollback();
             return false;
         }
     }
     public boolean save(Nhanvien nv){
         try {
             sf.getCurrentSession().beginTransaction();
             sf.getCurrentSession().save(nv);
             sf.getCurrentSession().getTransaction().commit();
             return true;
         } catch (Exception e) {
             sf.getCurrentSession().getTransaction().rollback();
             return false;
         }
     }
     public boolean update(Nhanvien nv){
         try {
             if (nv == null) {
            return false;
        }
             sf.getCurrentSession().beginTransaction();
             sf.getCurrentSession().update(nv);
             sf.getCurrentSession().getTransaction().commit();
             return true;
         } catch (Exception e) {
             sf.getCurrentSession().getTransaction().rollback();
             return false;
         }
     }
    
}
