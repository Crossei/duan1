/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import model.Khachhang;
import org.hibernate.Query;
import org.hibernate.Session;
import util.NewHibernateUtil;

/**
 *
 * @author Nguyen Van Dien
 */
public class KhachHangDao {
    public static List<Khachhang> ListDanhsach(String makh) {
        List<Khachhang> list = null;
        Session session = NewHibernateUtil.getSessionFactory().getCurrentSession();
        session.getTransaction().begin();
        String sql = "from Khachhang";
        if (makh.length() > 0) {
            sql += " " + makh;

        }
        Query query = session.createQuery(sql);
        list = query.list();
        session.close();
        return list;

    }
    public static Khachhang timkiem(String makh) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Khachhang nv = (Khachhang) session.get(Khachhang.class, makh);

        session.close();
        return nv;

    }
    public static boolean insert(Khachhang kh) {
        if (KhachHangDao.timkiem(kh.getMakh()) != null) {
            return false;
        }
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        try {
            session.getTransaction().begin();
            session.save(kh);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            return false;
        } finally {
            session.close();
        }

    }
}
