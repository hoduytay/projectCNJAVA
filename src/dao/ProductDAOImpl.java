package dao;
import java.util.List;

import org.hibernate.HibernateException;

import model.Product;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDAOImpl implements ProductDAO {
	
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void insertProduct(Product p) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(p);
			tx.commit();
		}catch(HibernateException e) {
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getListProduct() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Product> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM Product ORDER BY product_id DESC").list();
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getListproductByCategory(int category_id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Product> list = null;
		try {
			tx = session.beginTransaction();
			list = session.createQuery("FROM Product Where category_id='"+category_id+"' ORDER BY product_id DESC").list();
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

	@Override
	public Product getProduct(int product_id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Product p = null;
		try {
			tx = session.beginTransaction();
			p = (Product) session.createQuery("FROM Product where product_id='"+ product_id +"'").uniqueResult();
		}catch(HibernateException e) {
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return p;
	}

}
