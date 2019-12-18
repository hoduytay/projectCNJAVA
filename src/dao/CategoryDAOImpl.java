package dao;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

import model.Category;

public class CategoryDAOImpl implements CategoryDAO{

	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	@Override
	public void insertCategory(Category c) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(c);
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
	public List<Category> getCategoryByParent() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Category> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM Category where parent=0").list();
			tx.commit();
		}catch(HibernateException e) {
			if(tx !=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	
}
