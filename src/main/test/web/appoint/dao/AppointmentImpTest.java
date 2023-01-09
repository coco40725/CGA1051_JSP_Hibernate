package web.appoint.dao;

import com.core.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.testng.annotations.Test;
import com.web.appoint.model.dao.imp.AppointmentImp;
import com.web.appoint.model.entities.Appointment;

/**
@author Yu-Jing
@create 2023/1/3 下午 02:24
*/public class AppointmentImpTest {

    @Test
    public void testAdd() {
        AppointmentImp appointmentImp = new AppointmentImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            Appointment appointment = new Appointment();
            appointment.setSchID(40);
            appointment.setAmpStatus(2);
            appointment.setMemID(1);
            appointment.setPetID(1);
            appointment.setCustomerNote("我是測試狗狗!!");
            appointment.setTotalPrice(13999);
            appointmentImp.add(appointment);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testUpdate() {
        AppointmentImp appointmentImp = new AppointmentImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            Appointment appointment = new Appointment();
            appointment.setAmpID(12);
            appointment.setAmpStatus(1);
            appointment.setSchID(39);
            appointment.setCustomerNote("我是測試狗狗!! 我被改了!!");
            appointmentImp.update(appointment);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }


    @Test
    public void testGetAll() {
        AppointmentImp appointmentImp = new AppointmentImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(appointmentImp.getAll());
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testGetById() {
        AppointmentImp appointmentImp = new AppointmentImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(appointmentImp.getById(1));
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testFindAppointBySchId() {
        AppointmentImp appointmentImp = new AppointmentImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(appointmentImp.findAppointBySchId(199));
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testFindAppointByStatus() {
        AppointmentImp appointmentImp = new AppointmentImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(appointmentImp.findAppointByStatus(0));
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }
}