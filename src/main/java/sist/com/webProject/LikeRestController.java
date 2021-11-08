package sist.com.webProject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.LikeDao;
import sist.com.vo.LikeVO;

@RestController
public class LikeRestController{

	@Autowired
	private LikeDao dao;

//빈하트에서 찜하기 클릭 시 likemovie에 해당 정보 입력
	@RequestMapping(value="/movieProject/likeMovieInsert.do")
	public String likeMovieInsert(String id, String movieCd) {
		LikeVO vo=new LikeVO();
		vo.setId(id);
		vo.setMovieCd(movieCd);
		dao.likeMovieInsert(vo);
		return "";
	}
	
	//빨간하트에서 찜하기 클릭시 likemovie에서 해당 정보 삭제
	@RequestMapping(value="/movieProject/likeMovieDelete.do")
	public String likeMovieDelete(String id, String movieCd) {
		LikeVO vo= new LikeVO();
		vo.setId(id);
		vo.setMovieCd(movieCd);
		dao.likeMovieDelete(vo);
		return "";
	}
	
	//id, movidCd에 해당하는 영화가 찜 된 상태인지 확인
	@RequestMapping(value="/movieProject/likeMovieSearch.do")
	public String likeMovieSearch(String id, String movieCd) {
		LikeVO vo=new LikeVO();
		vo.setId(id);
		vo.setMovieCd(movieCd);
		return dao.likeMovieSearch(vo);
	}
	
	//내정보에서 likemovie데이터 출력
	@RequestMapping(value="/movieProject/likeMovieSelect.do")
	public List<LikeVO> likeMovieSelect(String id) {
		return dao.likemovieSelect(id);
	}
	
	//전체 좋아요 삭제
	@RequestMapping(value="/movieProject/deleteAllLike.do")
	public String deleteAllLike(String id) {
		dao.deleteAllLike(id);
		return "";
	}

}
