var httpRequest=null;
   function getXmlHttpRequest(){
      if(window.ActiveXObject){            
            try {
            return new ActiveXObject("Msxml2.XMLHTTP");
           }catch (e) {
            // TODO: handle exception
          } 
      } else if(window.XMLHttpRequest){         
         return new XMLHttpRequest();
      } 

	}//function ioc(제어역행)
	
	//자바스크립트-variable. 타입 지정 안함
	//콜백(제어역행): 거꾸로 부르는. 어플리케이션이 시스템 부르는 것은 콜, 시스템이 어플리케이션을 부르는 것이 콜백(ex>service메소드)
	function sendRequest(url,params,callback,method){   
		   httpRequest =getXmlHttpRequest(); //브라우저에서 엔진객체 얻어옴
		   var httpMethod=method?method:'GET'; //httpMethod는 method에 값이 있으면 method, 아니면 'GET'
		   if(httpMethod!='GET'&& httpMethod!='POST'){ //httpMethod가 GET도 아니고 POST도 아니면 GET
		      httpMethod='GET';
		   }
		   var httpParams=(params==null||params=='')?null:params; //httpParams는 params
		   var httpUrl=url;
		   if(httpMethod=='GET' && httpParams!=null){ //httpMethod가 GET이면서 httpParams이 null이 아니면 url 뒤에 변수(params)붙임
		      httpUrl=httpUrl+"?"+httpParams;
		   }
		   httpRequest.open(httpMethod,httpUrl,true);
		   //open(): 서버로 보낼 Ajax요청의 형식 설정. 첫번째인자: http메서드 지정(GET,POST), 두번째인자:요청을 처리할 서버의 파일 주소(웹브라우저 보안상 이유로 접속할 URL은 현재페이지와 같은 도메인에 있어야한다), 세번째인자: true:비동기방식, false:동기방식

		   httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		   
		    httpRequest.onreadystatechange=callback; //서버에서 응답이 오면 callback함수 처리한다
		    httpRequest.send(httpMethod=='POST'?httpParams:null); //작성된 Ajax요청을 서버로 전달함. POST방식이면 변수 넣고 아니면 null
		    
		}

