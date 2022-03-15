package com.one.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.NoticeDAO;
import com.one.dto.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<NoticeVO> selectNoticeList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> noticeList = session.selectList("Notice-Mapper.selectNoticeList", cri, rowBounds);

		return noticeList;

	}

	@Override
	public List<NoticeVO> selectImportantNoticeList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(0, limit);
		List<NoticeVO> noticeList = session.selectList("Notice-Mapper.selectImportantNoticeList", cri, rowBounds);

		return noticeList;
	}

	@Override
	public List<NoticeVO> selectNomalNoticeList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(0, limit);
		List<NoticeVO> noticeList = session.selectList("Notice-Mapper.selectNomalNoticeList", cri, rowBounds);

		return noticeList;
	}

	@Override
	public int selectImportantNoticeListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Notice-Mapper.selectImportantNoticeListCount", cri);
		return count;
	}

	@Override
	public int selectNomalNoticeListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Notice-Mapper.selectNomalNoticeListCount", cri);
		return count;
	}
	
	@Override
	public int selectNoticeListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Notice-Mapper.selectNoticeListCount", cri);
		return count;
	}

	@Override
	public NoticeVO selectNoticeByNoticeNo(int noticeNo) throws SQLException {

		return session.selectOne("Notice-Mapper.selectNoticeByNoticeNo",noticeNo);
	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.updateNotice",notice);

	}

	@Override
	public void deleteNotice(int[] noticeNo) throws SQLException {
		session.update("Notice-Mapper.deleteNotice", noticeNo);
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.insertNotice",notice);

	}

	@Override
	public int selectNoticeSeqNextValue() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Notice-Mapper.selectNoticeSeqNextValue");
	}

	@Override
	public void increaseViewCnt(int noticeNo) throws SQLException {
		session.update("Notice-Mapper.increaseViewCnt", noticeNo);
		
	}






}
