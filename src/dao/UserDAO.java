package dao;
import model.User;
public interface UserDAO {

		public void insertUser(User u);
		public User getUser(int user_id);
		public boolean checkLogin(String username,String password);
		public boolean checkUsername(String username);
}
