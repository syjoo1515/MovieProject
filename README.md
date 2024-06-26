## MovieProject - MOVIE PLANET

### 영화 검색 및 리뷰 작성 사이트
#### 로그인/회원가입, 영화검색, 찜하기, 리뷰 작성/수정 기능이 들어간 간단한 웹 페이지
<br>

프로젝트 기간 : 2021.10.24~2021.11.20

프로젝트 유형  :  개인 프로젝트

개발 환경  :  eclipse, SQL Developer, Oracle Cloud

사용 언어  :  JAVA, JSP, Javascript, HTML5, CSS3, Oracle

사용 프레임워크 :  Spring, MyBatis

운영체제 : Linux (Ubuntu)

WAS : tomcat 9.0

프로젝트 URL : http://movieplanet.ga/movieProject/home.jsp

개발 과정 기록(notion) : https://bit.ly/3CtlRG9


<br>

---

### 상세기능

* DB 
     * 영화진흥위원회 오픈 API를 사용해 2017년 1월 ~ 2021년 11월까지 제작된 총 2639개의 영화 정보 저장
     * 웹 크롤링을 통해 영화 포스터/시나리오 정보 저장

* navbar 
     * 로그인 세션 확인 후 데이터가 있으면 *마이페이지* 표시, 없으면 *로그인/회원가입* 표시

* 홈화면 
     * MOVIEPOSTER 테이블에 저장된 포스터를 랜덤으로 선택해서 출력

* 박스오피스 
     * 어제 날짜의 박스오피스 출력 (영화진흥위원회 오픈 API 사용), 화살표로 조회 날짜 변경
     * 포스터 클릭 시 영화 상세정보 페이지로 이동
            
* 영화 검색 
     * 영화명, 감독명, 배우명 총 3개의 항목으로 검색 가능
      * 검색 시 해당 조건에 맞는 영화 리스트가 출력되고 각 영화에 대한 찜하기/상세정보 바로가기 기능 제공
      * 찜하기는 로그인 시에만 사용 가능하며 비로그인시 로그인 페이지로 이동

* 영화 상세정보 
     * 영화 포스터, 시나리오, 영문명, 개봉일 등 상세정보 출력
     * 리뷰 작성, 전체 리뷰 보기, 찜하기 기능 제공
     * 리뷰작성/찜하기는 로그인 시에만 사용 가능하며 비로그인시 로그인 페이지로 이동
     * 리뷰 작성 클릭 시 리뷰 작성 가능한 모달창이 뜨고, 제목/별점/내용 작성 가능
     * 전체 리뷰 클릭 시 해당 영화에 달린 리뷰를 확인할 수 있고 본인이 작성한 리뷰는 수정 가능
               
* 회원가입/로그인 
     * 회원가입 시 아이디 중복체크, 비밀번호 정규식 체크, 비밀번호 확인 
     * 로그인 시 아이디 쿠키 저장 가능
                 
* 마이페이지 
     * 회원정보 보기, 회원정보 수정, 작성한 리뷰, 찜한 영화, 회원 탈퇴 기능 제공
     * 회원정보 보기에서 비밀번호 입력 후 회원 정보 수정 가능
     * 작성한 리뷰에서 리뷰 전체삭제/개별삭제 가능. 수정하기 클릭 시 해당 영화 상세정보 페이지로 이동 후 수정 가능
     * 찜한 영화에서 찜 전체삭제/개별삭제 가능
     * 회원 탈퇴에서 비밀번호 입력 후 회원 탈퇴 가능
