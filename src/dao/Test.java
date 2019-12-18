package dao;
import model.Category;
public class Test {
	public static void main(String[] args) {;
	Category c= new Category(0, "menu1", 0);
	CategoryDAOImpl categoryDAOImpl = new CategoryDAOImpl();
	categoryDAOImpl.insertCategory(c);
	for(Category c1 : categoryDAOImpl.getCategoryByParent()) {
		System.out.print(c.getName());
	}
	}

}
