package dao;
import model.User;
import model.Category;
import model.Product;
public class Test {
	public static void main(String[] args) {
	//Category c= new Category(0, "menu1", 0);
	//CategoryDAOImpl categoryDAOImpl = new CategoryDAOImpl();
	//categoryDAOImpl.insertCategory(c);
	//for(Category c1 : categoryDAOImpl.getCategoryByParent()) {
		//System.out.print(c.getName());
	//}
	//for (Category c2: categoryDAOImpl.getCategoryByChildren(1)) {
		
		//System.out.println(c2.getName());
	//}	
	//ProductDAOImpl productDAO = new ProductDAOImpl();
	//for(int i=1;i<=11;i++) {
		//productDAO.insertProduct(new Product(0,"p" + i,"img.png",0 + i,"SP" + i,2));
	//}
	//for (Product p : productDAO.getListProduct()) {
		//System.out.println(p.getName());
	//}
	//for(Product p:productDAO.getListproductByCategory(2)) {
			//System.out.println(p.getName());
	//}
	//System.out.println(productDAO.getProduct(1).getName());
		UserDAOImpl userDAO = new UserDAOImpl();
		//userDAO.insertUser(new User(0,"khanh","12345",2));
		System.out.println(userDAO.checkLogin("admin", "1234"));
}


}
