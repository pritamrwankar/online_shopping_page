package learn.cart.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class UserDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10)
	 private int userId;
	@Column(length = 100)
	 private String userName;
	@Column(length = 100)
	 private String userEmail;
	@Column(length = 100)
	 private String userPassword;
	 private String userphone;
	 @Column(length = 1500)
	 private String userPic;
	 @Column(length = 1500)
	 private String userAdderss;
	 private String userType;
	 
	public UserDetails(int userId, String userName, String userEmail, String userPassword, String userphone, String userPic,
			String userAdderss,String userType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userphone = userphone;
		this.userPic = userPic;
		this.userAdderss = userAdderss;
		this.userType=userType;
	}
	public UserDetails(String userName, String userEmail, String userPassword, String userphone, String userPic,
			String userAdderss,String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userphone = userphone;
		this.userPic = userPic;
		this.userAdderss = userAdderss;
		this.userType=userType;
	}
	public UserDetails() {
		super();
	}
	
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getUserAdderss() {
		return userAdderss;
	}
	public void setUserAdderss(String userAdderss) {
		this.userAdderss = userAdderss;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userphone=" + userphone + ", userPic=" + userPic + ", userAdderss=" + userAdderss
				+ "]";
	}
	 
	 
}
