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
@NoArgsConstructor //�⺻������
@AllArgsConstructor //�������� ����
@Data //get,set,������, tostring ��� ����
public class Action {
	private String actionName;
	private int actionCount;
	private String actionNode;
	
	
	
	

}
