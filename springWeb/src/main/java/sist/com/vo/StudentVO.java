package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudentVO {
   private String studno;
   private String name;
   private String userid;
   private String grade;
   private String idnum;
   private String birthdate;
   private String tel;
   private double height;
   private double weight;
   private int deptno;
   private int profno;

}