package sist.com.di.basic9;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@ToString
@Setter*/
@NoArgsConstructor //기본생성자
@AllArgsConstructor //모든생성자 만듦
@Data //get,set,생성자, tostring 모두 만듦
public class ServiceProcess {
	private String serviceName;
	private int serviceTime;
	private String serviceKind;
	
	public static void main(String[] args) {
		System.out.println(new ServiceProcess());
		ServiceProcess s=new ServiceProcess("ha",12,"al");
	}

}
