package Servlet;

public class UserDto {
	private String username;
	private String password;
	
	// 생성자 -2
	public UserDto() {}

	public UserDto(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	// 게터 & 세터
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

	// 투스트링
	@Override
	public String toString() {
		return "UserDto [username=" + username + ", password=" + password + "]";
	}
}
	
	
