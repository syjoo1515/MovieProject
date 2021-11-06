package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {

	private int no;
	private String id;
	private String password;
	private String username;
	private String email;
	private String phone;
	private String regdate;
	
}
