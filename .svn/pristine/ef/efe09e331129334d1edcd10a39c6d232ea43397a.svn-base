package com.one.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dao.AttachDAO;
import com.one.dao.NoticeDAO;
import com.one.dto.AttachVO;
import com.one.dto.FaqVO;
import com.one.dto.NoticeVO;
import com.one.service.NoticeService;
import com.one.utils.MakeFileName;

public class NoticeServiceImpl implements NoticeService {

	NoticeDAO noticeDAO;

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	private AttachDAO attachDAO;

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public Map<String, Object> getNoticeList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<NoticeVO> noticeList = noticeDAO.selectNoticeList(cri);
		
		for(int i=0;i<noticeList.size();i++) {
			List<AttachVO> attachList = MakeFileName.parseFileNameFromAttaches(
					attachDAO.selectAttachesByBno(noticeList.get(i).getNoticeNo()), "$$");
	/*		List<AttachVO> attachList = 
					attachDAO.selectAttachesByBno(noticeList.get(i).getNoticeNo());*/
			if(attachList != null) {
				noticeList.get(i).setAttachList(attachList);
				
			}
		}
		
		int totalCount = noticeDAO.selectNoticeListCount(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}


	@Override
	public List<NoticeVO> getImportantNoticeList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<NoticeVO> noticeList = noticeDAO.selectImportantNoticeList(cri);
		
		for(int i=0;i<noticeList.size();i++) {
			List<AttachVO> attachList = MakeFileName.parseFileNameFromAttaches(
					attachDAO.selectAttachesByBno(noticeList.get(i).getNoticeNo()), "$$");
	/*		List<AttachVO> attachList = 
					attachDAO.selectAttachesByBno(noticeList.get(i).getNoticeNo());*/
			if(attachList != null) {
				noticeList.get(i).setAttachList(attachList);
				
			}
		
		}

		return noticeList;
	}

	@Override
	public List<NoticeVO> getNomalNoticeList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<NoticeVO> noticeList = noticeDAO.selectNomalNoticeList(cri);

		for(int i=0;i<noticeList.size();i++) {
			List<AttachVO> attachList = MakeFileName.parseFileNameFromAttaches(
					attachDAO.selectAttachesByBno(noticeList.get(i).getNoticeNo()), "$$");
	/*		List<AttachVO> attachList = 
					attachDAO.selectAttachesByBno(noticeList.get(i).getNoticeNo());*/
			if(attachList != null) {
				noticeList.get(i).setAttachList(attachList);
			}
		}
		return noticeList;
	}

	

	@Override
	public NoticeVO getNotice(int noticeNo) throws SQLException {
		NoticeVO notice = noticeDAO.selectNoticeByNoticeNo(noticeNo);

			List<AttachVO> attachList = MakeFileName.parseFileNameFromAttaches(
					attachDAO.selectAttachesByBno(noticeNo),"$$");
			if(attachList != null) {
				notice.setAttachList(attachList);
			}
		
		return notice;
	}

	@Override
	public void regist(NoticeVO notice, List<AttachVO> attachList) throws SQLException {
		int bno = noticeDAO.selectNoticeSeqNextValue();
		notice.setNoticeNo(bno);
		noticeDAO.insertNotice(notice);

		if (attachList != null)
			for (AttachVO attach : attachList) {
				attach.setBno(bno);
				 // System.out.println(attach.getBno());
				// System.out.println(attach);
				 
				attachDAO.insertAttach(attach);
			}

	}

	@Override
	public void modify(NoticeVO notice, List<AttachVO> attachList) throws SQLException {
		noticeDAO.updateNotice(notice);
		if (attachList != null)
			for (AttachVO attach : attachList) {
				attach.setBno(notice.getNoticeNo());
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void remove(int[] noticeNo) throws SQLException {

		noticeDAO.deleteNotice(noticeNo);

	}

	@Override
	public NoticeVO read(int noticeNo) throws SQLException {
		NoticeVO notice = noticeDAO.selectNoticeByNoticeNo(noticeNo);
		noticeDAO.increaseViewCnt(noticeNo);
		addAttachList(notice);
		
		return notice;
	}

	private void addAttachList(NoticeVO notice)throws SQLException {
		if(notice == null)
			return;
		
		int noticeNo = notice.getNoticeNo();
		List<AttachVO> attachList = attachDAO.selectAttachesByBno(noticeNo);
		
		notice.setAttachList(attachList);
		
	}

	@Override
	public AttachVO getAttachByAno(int ano) throws SQLException {

		return attachDAO.selectAttachByAno(ano);
	}

	@Override
	public void removeAttachByAno(int ano) throws SQLException {
		attachDAO.deleteAttach(ano);
		
	}



}
