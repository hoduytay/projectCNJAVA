package model;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;

@Entity
@Table(name="USER")
public class User {

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int user_id=0;
		@Column(name="username")
		private String username;
		@Column(name="password")
		private String password;
		@Column(name="role")
		private int role;
		public User() {
		
		}
		public User(int user_id, String username, String password, int role) {
			this.user_id = user_id;
			this.username = username;
			this.password = password;
			this.role = role;
		}
		public int getUser_id() {
			return user_id;
		}
		public void setUser_id(int user_id) {
			this.user_id = user_id;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public int getRole() {
			return role;
		}
		public void setRole(int role) {
			this.role = role;
		}
		
		
}
