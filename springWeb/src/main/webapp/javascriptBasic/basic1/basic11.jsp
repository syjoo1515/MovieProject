<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
  /*  var showObject=function(){
      var person={name:'유주',
                addr:['서울',['해운대','광안리','태종대'],'전주'],
                eat:function(food){
                alert(this.name+'가 '+this.addr[1][parseInt(Math.random()*3)]+'에서 '+food+'를 먹어요');   
                }          
      
      
      };
      person.eat('만두');
   }  */
   function showStudent(){
     /*  var students=[{name:'윤영',kor:95,eng:85,mat:100},
                   {name:'유주',kor:75,eng:100,mat:100},
                   {name:'래현',kor:100,eng:100,mat:100},
                   {name:'형권',kor:95,eng:85,mat:70},
                   {name:'호준',kor:100,eng:100,mat:70},         
                   {name:'의정',kor:100,eng:100,mat:70}         
                  ]; */
      /* for(var i in students){
         for(var j in students[i]){
            console.log(j+':'+students[i][j]);
         }
      } */
      
       var students=[{name:'윤영',kor:95,eng:85,mat:100,
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
   lesson.addr='강남';
   console.log(lesson.time+' '+lesson['time']); */
</script>
</head>
<body>
<input type="button" value="Person" ondblclick="showObject()">
<input type="button" value="Student" onclick ="showStudent()"><br>
</body>
</html>











