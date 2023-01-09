package web.job.dao;

import com.core.util.HibernateUtil;
import com.web.job.model.dao.JobScheduleImp;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.testng.annotations.Test;
import com.web.job.model.entities.JobSchedule;

import java.sql.Date;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 02:24
 */
public class JobScheduleImpTest {

    @Test
    public void testAdd() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            JobSchedule jobSchedule = new JobSchedule();
            jobSchedule.setSchDate(Date.valueOf("2023-01-13"));
            jobSchedule.setSchPeriod("下午");
            jobSchedule.setGroomerID(2);
            jobSchedule.setAsstID1(2);
            jobSchedule.setAsstID2(5);
            jobSchedule.setEmployeeNote("這是測試2121212!!");
            System.out.println(jobScheduleImp.add(jobSchedule));
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testAddBatch() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            JobSchedule[] jobSchedules = new JobSchedule[2];
            // 資料 1
            jobSchedules[0] = new JobSchedule();
            jobSchedules[0].setSchDate(Date.valueOf("2023-02-04"));
            jobSchedules[0].setSchPeriod("下午");
            jobSchedules[0].setGroomerID(1);
            jobSchedules[0].setAsstID1(1);
            jobSchedules[0].setAsstID2(2);
            jobSchedules[0].setEmployeeNote("這是測試 1!!");
            // 資料 2
            jobSchedules[1] = new JobSchedule();
            jobSchedules[1].setSchDate(Date.valueOf("2023-02-05"));
            jobSchedules[1].setSchPeriod("下午");
            jobSchedules[1].setGroomerID(1);
            jobSchedules[1].setAsstID1(1);
            jobSchedules[1].setAsstID2(2);
            jobSchedules[1].setEmployeeNote("這是測試 2!!");

            jobScheduleImp.addBatch(jobSchedules);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testUpdate() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            JobSchedule jobSchedule = new JobSchedule();
            jobSchedule.setSchID(41);
            jobSchedule.setSchDate(Date.valueOf("2023-02-03"));
            jobSchedule.setSchPeriod("下午");
            jobSchedule.setGroomerID(1);
            jobSchedule.setAsstID1(1);
            jobSchedule.setAsstID2(2);
            jobSchedule.setEmployeeNote("這是測試!! 大修改!!!");

            jobScheduleImp.update(jobSchedule);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testDelete() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            jobScheduleImp.delete(41);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testGetAll() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(jobScheduleImp.getAll());
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testGetById() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(jobScheduleImp.getById(1));
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testGetSchByDatePeriod() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(jobScheduleImp.getSchByDatePeriod(Date.valueOf("2022-12-27"), "上午"));
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testGetEmpsByDatePeriod() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(jobScheduleImp.getEmpsByDatePeriod(Date.valueOf("2022-12-27"), "上午"));
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }

    @Test
    public void testFindIllegalDatesToAddJobs() {
        JobScheduleImp jobScheduleImp = new JobScheduleImp();
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            System.out.println(jobScheduleImp.findIllegalDatesToAddJobs(2,2,5,"下午"));
            transaction.commit();
        }catch (HibernateException e){
            e.printStackTrace();
            if (transaction != null) transaction.rollback();
        }
    }
}