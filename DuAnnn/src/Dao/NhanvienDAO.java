/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.util.List;
import entities.Nhanvien;
import org.hibernate.SessionFactory;
import Util.NewHibernateUtil;
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
        String sql = "from Khachhang";
        if (manv.length() > 0) {
            sql += " " + manv;

        }
        Query query = session.createQuery(sql);
        list = query.list();
        session.close();
        return list;

    }
}
