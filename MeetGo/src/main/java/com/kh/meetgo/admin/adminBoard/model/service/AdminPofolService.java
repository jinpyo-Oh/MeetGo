package com.kh.meetgo.admin.adminBoard.model.service;

import java.util.ArrayList;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.PofolOpt;

public interface AdminPofolService {

	int selectAdminPofolListCount(String keyword);
	ArrayList<PofolOpt> selectAdminPofolList(String keyword, PageInfo pi);
	ArrayList<PofolOpt> adminPofolDetail(int pofolNo);
	
	int changePofolStatus(int pofolNo, int pofolStatus);
}
