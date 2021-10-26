package sist.com.di.basic9;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@Getter
@Setter
@NoArgsConstructor //기본생성자
@AllArgsConstructor //모든생성자 만듦
@Data //get,set,생성자, tostring 모두 만듦
public class Action {
	private String actionName;
	private int actionCount;
	private String actionNode;
	
	
	
	

}
