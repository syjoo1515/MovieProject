package sist.com.di.basic9;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@ToString
@Setter*/
@NoArgsConstructor //�⺻������
@AllArgsConstructor //�������� ����
@Data //get,set,������, tostring ��� ����
public class ServiceProcess {
	private String serviceName;
	private int serviceTime;
	private String serviceKind;
	
	public static void main(String[] args) {
		System.out.println(new ServiceProcess());
		ServiceProcess s=new ServiceProcess("ha",12,"al");
	}

}
