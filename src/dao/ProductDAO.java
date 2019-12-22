package dao;
import model.Product;
import java.util.List;
public interface ProductDAO {

	public void insertProduct(Product p);
	public List<Product> getListProduct();
	public List<Product> getListproductByCategory(int category_id);
}
