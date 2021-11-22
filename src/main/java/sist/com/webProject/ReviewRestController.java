package sist.com.webProject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.ReviewDao;
import sist.com.vo.ReviewVO;

@RestController
public class ReviewRestController{
 
	@Autowired	
	private ReviewDao dao;
	
	//리뷰 작성한거 DB에 insert
		@RequestMapping(value="/reviewForm.do")
		public String reviewForm(ReviewVO vo) {
			int no=dao.getReviewSequence();
			vo.setNo(no);
			System.out.println(vo);
			dao.reviewForm(vo);
			return "";
		}
		
		//리뷰 작성한거 DB에서 select-영화명기준
		@RequestMapping(value="/showReview.do")
		public List<ReviewVO> showReview(String movieCd) {
			return dao.showReview(movieCd);
		}
		//리뷰 작성한거 DB에서 select-id기준
		@RequestMapping(value="/reviewMovieSelect.do")
		public List<ReviewVO> reviewMovieSelect(String id){
			return dao.reviewMovieSelect(id);
		}
		
		//리뷰 삭제
		@RequestMapping(value="/deleteReview.do")
		public String deleteReview(int no) {
			dao.deleteReview(no);
			return "";
		}
		
		//전체 리뷰 삭제
		@RequestMapping(value="/deleteAllReview.do")
		public String deleteAllReview(String id) {
			dao.deleteAllReview(id);
			return "";
		}
		
		//리뷰 수정
		@RequestMapping(value="/reviewFormUpdate.do")
		public String reviewFormUpdate(ReviewVO vo) {
			dao.reviewFormUpdate(vo);
			return "";
		}
}
