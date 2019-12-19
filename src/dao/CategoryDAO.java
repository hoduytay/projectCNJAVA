package dao;
import java.util.List;
import model.Category;

public interface CategoryDAO {
	
	public void insertCategory(Category c);
	
	public List<Category> getCategoryByParent();
	
	public List<Category> getCategoryByChildren(int parent);

}