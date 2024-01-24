package com.injoit.mvc.repository;

import java.util.List;

import com.injoit.mvc.bean.BoardFileDTO;
import com.injoit.mvc.bean.EmpApprovalDTO;

public interface BoardMapper {
	public int getAppNum();
	public EmpApprovalDTO getAppContent(int num);
	public void ApvalReg(EmpApprovalDTO dto);
	public List<EmpApprovalDTO> ApvalList();
	public void ApvalUpdate(EmpApprovalDTO dto);
	public void ApvalFileReg(BoardFileDTO dto);
	public void deleteFileName(String filename);
	public void deleteFileAll(int num);
	public void ApvalDelete(int num);
}
