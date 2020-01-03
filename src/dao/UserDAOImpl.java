package dao;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Product;
import model.User;
import util.HibernateUtil;
public class UserDAOImpl implements UserDAO {

		private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		@Override
		public void insertUser(User u) {
			Session session = sessionFactory.openSession();
			Transaction tx = null;
			try {
				session = sessionFactory.openSession();
				tx = session.beginTransaction();
				session.save(u);
				tx.commit();
			}catch(HibernateException e){
				if(tx !=null)
					tx.rollback();
				e.printStackTrace();
			}finally {
				session.close();
			}
		}
		@Override
		public User getUser(int user_id) {
			Session session = sessionFactory.openSession();
			Transaction tx = null;
			User u = null;
			try {
				tx = session.beginTransaction();
				u = (User) session.createQuery("FROM User where user_id='"+ user_id +"'").uniqueResult();
				tx.commit();
			}catch(HibernateException e) {
				if(tx!=null)
					tx.rollback();
				e.printStackTrace();
			}finally {
				session.close();
			}
			return u;
		}
		@SuppressWarnings("unchecked")
		@Override
		public boolean checkLogin(String username, String password) {
			Session session = sessionFactory.openSession();
			Transaction tx = null;
			List<User> u = null;
			try {
				tx = session.beginTransaction();
				u = session.createQuery("FROM User where username='"+ username +"'and password='"+password+"' ").list();
				tx.commit();
				if(u.size()>=1) {
					return true;
				}
			}catch(HibernateException e) {
				if(tx!=null)
					tx.rollback();
				e.printStackTrace();
			}finally {
				session.close();
			}
			return false;
		}
		@SuppressWarnings("unchecked")
		@Override
		public boolean checkUsername(String username) {
			Session session = sessionFactory.openSession();
			Transaction tx = null;
			List<User> u = null;
			try {
				tx = session.beginTransaction();
				u = session.createQuery("FROM User where username='"+ username +"' ").list();
				tx.commit();
				if(u.size()>=1) {
					return true;
				}
			}catch(HibernateException e) {
				if(tx!=null)
					tx.rollback();
				e.printStackTrace();
			}finally {
				session.close();
			}
			return false;
		}
}
