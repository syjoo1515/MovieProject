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
		@RequestMapping(value="/movieProject/reviewForm.do")
		public String reviewForm(ReviewVO vo) {
			dao.reviewForm(vo);
			return "";
		}
		
		//리뷰 작성한거 DB에서 select-영화명기준
		@RequestMapping(value="/movieProject/showReview.do")
		public List<ReviewVO> showReview(String movieCd) {
			return dao.showReview(movieCd);
		}
		//리뷰 작성한거 DB에서 select-id기준
		@RequestMapping(value="/movieProject/writingMovieSelect.do")
		public List<ReviewVO> writingMovieSelect(String id){
			return dao.writingMovieSelect(id);
		}
}
