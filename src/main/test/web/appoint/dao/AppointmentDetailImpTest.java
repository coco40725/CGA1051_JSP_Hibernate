package web.appoint.dao;

import com.core.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.testng.annotations.Test;
import com.web.appoint.model.dao.imp.AppointmentDetailImp;
import com.web.appoint.model.entities.AppointmentDetail;


/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 02:24
 */
public class AppointmentDetailImpTest {
    @Test
    public void testAdd() {
        AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            AppointmentDetail appointmentDetail = new AppointmentDetail();
            appointmentDetail.setAmpId(1);
            appointmentDetail.setSvcId(2);
            appointmentDetail.setSaleId(2);
            appointmentDetail.setSalePrice(12000);
            appointmentDetail.setSvcPrice(15000);
            appointmentDetailImp.add(appointmentDetail);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testAddBatch() {
        AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            AppointmentDetail[] appointmentDetails = new AppointmentDetail[2];
            // 資料 1
            appointmentDetails[0] = new AppointmentDetail();
            appointmentDetails[0].setAmpId(1);
            appointmentDetails[0].setSvcId(4);
            appointmentDetails[0].setSaleId(2);
            appointmentDetails[0].setSalePrice(21000);
            appointmentDetails[0].setSvcPrice(45000);
            // 資料 2
            appointmentDetails[1] = new AppointmentDetail();
            appointmentDetails[1].setAmpId(1);
            appointmentDetails[1].setSvcId(3);
            appointmentDetails[1].setSaleId(2);
            appointmentDetails[1].setSalePrice(120);
            appointmentDetails[1].setSvcPrice(150);

            appointmentDetailImp.addBatch(appointmentDetails);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }


    @Test
    public void testGetAll() {
        AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(appointmentDetailImp.getAll());
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testGetById() {
        AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            AppointmentDetail.PK pk = new AppointmentDetail.PK();
            pk.ampId = 2;
            pk.svcId = 6;
            System.out.println(appointmentDetailImp.getById(pk));
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testGetTotalPriceByAmpId(){
        AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();

            System.out.println(appointmentDetailImp.getTotalPriceByAmpId(10));
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testGetAllServicesByAmpId() {
        AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(appointmentDetailImp.getAllServicesByAmpId(10));
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testDeleteByAmpId() {
        AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();

            System.out.println(appointmentDetailImp.deleteByAmpId(11));
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }
}