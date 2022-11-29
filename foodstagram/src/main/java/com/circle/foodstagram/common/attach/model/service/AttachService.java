package com.circle.foodstagram.common.attach.model.service;

import java.util.List;

import com.circle.foodstagram.common.attach.model.vo.Attach;

public interface AttachService {
	int insertAttach(Attach attach);
	//public List<AttachVO> getAttachListByParent(@Param(value = "atchParentNo")int atchParentNo, @Param(value = "atchCategory")String atchCategory);
	public List<Attach> getAttachListByParent(int atch_parent_no, String atch_category);
	
	Attach getAttach(int atch_no);
	int deleteAttach(int atch_no);
}
