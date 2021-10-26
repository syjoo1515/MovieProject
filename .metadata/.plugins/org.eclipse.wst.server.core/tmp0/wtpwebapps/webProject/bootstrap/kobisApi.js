/**
 * 
 */
var dt=new Date(); //현재날짜&시간
	var m=dt.getMonth()+1; //월은 0부터 시작해서 1 더해줘야함
	if(m<10){
		var month="0"+m;
	}else{
		var month=m;
	}
	
	var d=dt.getDate()-1; //하루전꺼 검색
	if(d<10){
		var day="0"+d;
	}else{
		var day=d;
	}
	
	var year=dt.getFullYear();

	var result=year+""+month+""+day;
	$(function(){
		$.ajax({
			url:"https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=12ff9134153dd158e068074390244746&targetDt="+result,
			dataType:"json",
			success:function(v){
				console.log(v);
			},
			error:function(){
				alert("error!");
			}
		})
	});