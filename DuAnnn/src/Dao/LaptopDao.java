/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.util.List;
import entities.Laptop;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import Util.NewHibernateUtil;

/**
 *
 * @author Nguyen Van Dien
 */
public class LaptopDao {
    public static List<Laptop> LayThongTinLT(String malaptop){
        List<Laptop> list = null;
        Session session = NewHibernateUtil.getSessionFactory().getCurrentSession();
        session.getTransaction().begin();
        String sql = "from Laptop";
        if (malaptop.length() > 0) {
            sql += " " + malaptop;

        }
        Query query = session.createQuery(sql);
        list = query.list();
        session.close();
        return list;
    }
    public static Laptop timKiem(String malaptop) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Laptop lt = (Laptop) session.get(Laptop.class, malaptop);
        session.close();
        return lt;
    }
     public static List<Laptop> search(String name) {
        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory().openSession().getSessionFactory();
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(Laptop.class);
        if (name != null) {
            criteria.add(Restrictions.like("tenlaptop", "%" + name + "%"));
        }
        List<Laptop> result = criteria.list();
        return result;
    }
     public static boolean insert(Laptop lt){
         if(LaptopDao.timKiem(lt.getMalaptop()) != null){
             return false;
         }
         Session session = NewHibernateUtil.getSessionFactory().openSession();
         try {
             session.getTransaction().begin();
             session.save(lt);
             session.getTransaction().commit();
             return true;
         } catch (Exception e) {
             session.getTransaction().rollback();
             return false;
         }
     }
}
