package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.one.command.ClassCommand;
import com.one.command.ClassReviewCommand;
import com.one.dao.JMSClassDAO;
import com.one.dto.MemberClVO;
import com.one.dto.MemberVO;
import com.one.dto.ClassVO.ClassChapterVO;
import com.one.dto.ClassVO.ClassDocumentVO;
import com.one.dto.ClassVO.ClassListVO;
import com.one.dto.ClassVO.ClassReviewVO;

public class JMSClassDAOImpl implements JMSClassDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public ClassCommand selectClassAndOpClByOpcl(int opcl) throws SQLException {
		ClassCommand claz = session.selectOne("JMSClass-Mapper.selectClassAndOpClByOpcl", opcl);
		return claz;
	}

	@Override
	public List<ClassDocumentVO> selectClDocListByOpcl(int opcl) throws SQLException {
		List<ClassDocumentVO> docList = session.selectList("JMSClass-Mapper.selectClDocListByOpcl", opcl);
		return docList;
	}

	@Override
	public List<ClassChapterVO> selectClChapterListByOpcl(int opcl) throws SQLException {
		List<ClassChapterVO> chapList = session.selectList("JMSClass-Mapper.selectClChapterListByOpcl", opcl);
		return chapList;
	}

	@Override
	public List<ClassReviewCommand> selectClReviewListByOpcl(int opcl) throws SQLException {
		List<ClassReviewCommand> reviewList = session.selectList("JMSClass-Mapper.selectClReviewListByOpcl", opcl);
		return reviewList;
	}

	@Override
	public MemberVO selectMemberByMemId(String memId) throws SQLException {
		MemberVO member =session.selectOne("JMSClass-Mapper.selectMemberByMemId", memId);
		return member;
	}

	@Override
	public double selectAvgReviewScoreByOpcl(int opcl) throws SQLException {
		double avg = 0.0;
		if(session.selectOne("JMSClass-Mapper.selectAvgReviewScoreByOpcl", opcl) != null) {
			avg = session.selectOne("JMSClass-Mapper.selectAvgReviewScoreByOpcl", opcl);
		}
		return avg;
	}

	@Override
	public Boolean checkMemChap(MemberClVO clChap) throws SQLException {
		Boolean chk = true;
		MemberClVO chap = session.selectOne("JMSClass-Mapper.checkMemChap", clChap);
		if(chap == null) {
			chk = false;
		}
		return chk;
	}

	@Override
	public MemberClVO getMemChap(MemberClVO memChap) throws SQLException {
		MemberClVO chapInfo = session.selectOne("JMSClass-Mapper.checkMemChap", memChap);
		return chapInfo;
	}

	@Override
	public void deleteStudyingClass(MemberClVO memClVO) throws SQLException {
		session.delete("JMSClass-Mapper.deleteStudyingClass", memClVO);

	}

	@Override
	public List<MemberClVO> selectAllProgChapByMemClNo(int memClNo) throws SQLException {
		List<MemberClVO> allProgChapList = session.selectList("JMSClass-Mapper.selectAllProgChapByMemClNo", memClNo);
		return allProgChapList;
	}

	@Override
	public int selectProgRate(ClassListVO classVO) throws SQLException {
		return session.selectOne("JMSClass-Mapper.selectProgRate", classVO);
	}

	@Override
	public List<MemberVO> getMem() {
		List<MemberVO> memList = session.selectList("JMSClass-Mapper.mem");
		return memList;
	}

	@Override
	public void setPwd(MemberVO mem) {
		 session.update("JMSClass-Mapper.pwd", mem);

	}
}
