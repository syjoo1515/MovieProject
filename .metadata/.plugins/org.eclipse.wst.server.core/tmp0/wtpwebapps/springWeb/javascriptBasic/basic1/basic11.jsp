<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
  /*  var showObject=function(){
      var person={name:'����',
                addr:['����',['�ؿ��','���ȸ�','������'],'����'],
                eat:function(food){
                alert(this.name+'�� '+this.addr[1][parseInt(Math.random()*3)]+'���� '+food+'�� �Ծ��');   
                }          
      
      
      };
      person.eat('����');
   }  */
   function showStudent(){
     /*  var students=[{name:'����',kor:95,eng:85,mat:100},
                   {name:'����',kor:75,eng:100,mat:100},
                   {name:'����',kor:100,eng:100,mat:100},
                   {name:'����',kor:95,eng:85,mat:70},
                   {name:'ȣ��',kor:100,eng:100,mat:70},         
                   {name:'����',kor:100,eng:100,mat:70}         
                  ]; */
      /* for(var i in students){
         for(var j in students[i]){
            console.log(j+':'+students[i][j]);
         }
      } */
      
       var students=[{name:'����',kor:95,eng:85,mat:100,
                    total:function(){return this.kor+this.eng+this.mat},
                    avg:function(){return (this.kor+this.eng+this.mat)/3.0}}
                
         ]; 
      for(var i in students){
         for(var j in students[i]){
            if(typeof(students[i][j])=='function'){
               console.log(students[i][j]());
            }
            console.log(j+' '+students[i][j]+' '+typeof(students[i][j]));
         }
      }
   }
  /*  var lesson={};
   lesson.time=8;
   lesson.title='javaLesson';
   lesson.addr='����';
   console.log(lesson.time+' '+lesson['time']); */
</script>
</head>
<body>
<input type="button" value="Person" ondblclick="showObject()">
<input type="button" value="Student" onclick ="showStudent()"><br>
</body>
</html>











