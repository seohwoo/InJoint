package com.injoit.mvc.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.injoit.mvc.bean.BoardFileDTO;
import com.injoit.mvc.bean.EmpApprovalDTO;
import com.injoit.mvc.repository.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public void ApprovalReg(String id,String title,String content,String realPath,HttpSession session) {
            // ���� temp������ ����� �̹��� ǥ�ø� ���� �����Ϳ��� /temp�� ��ΰ� �����Ǿ� �ִ� 
            // �̸� ������ �Խñ� ���� ��ȣ�� �����Ѵ�.
        	int board_num=mapper.getAppNum();
            content = content.replaceAll("/temp", "/" + board_num);

            // temp ���� ���� �̹����� �Խñ� ����ҷ� �̵�
            String path_folder1 = realPath + "/temp/";
            String path_folder2 = realPath + "/"+board_num+"/";

            // ���� ���� �Լ�
            fileUpload(path_folder1, path_folder2,board_num);
            EmpApprovalDTO dto = new EmpApprovalDTO();
            dto.setContent(content);
            dto.setWriter(id);
            dto.setTitle(title);
            dto.setNo(board_num);
            deleteFolder(path_folder1);
            mapper.ApvalReg(dto);
            
            
            
}
	  private void fileUpload(String path_folder1, String path_folder2,int num) {
	        // path_folder1���� path_folder2�� ������ �����ϴ� �Լ��Դϴ�.
		  System.out.println("fileUpload====");
	        File folder1;
	        File folder2;
	        folder1 = new File(path_folder1);
	        folder2 = new File(path_folder2);

	        // ������ �������� �������� ������ �����մϴ�.
	        if (!folder1.exists())
	            folder1.mkdirs();
	        if (!folder2.exists())
	            folder2.mkdirs();

	        // ����1���� ���� ����� �����ɴϴ�.
	        File[] target_file = folder1.listFiles();
	        for (File file : target_file) {
	            // ���� ��� ������ ��ο� �̸��� �����մϴ�.
	            File temp = new File(folder2.getAbsolutePath() + File.separator + file.getName());

	            if (file.isDirectory()) {
	                // ����� ������ ���, �ش� ������ �����մϴ�.
	                temp.mkdir();
	            } else {
	                FileInputStream fis = null;
	                FileOutputStream fos = null;
	                try {
	                    // ���� ���縦 ���� FileInputStream�� FileOutputStream�� �����մϴ�.
	                    fis = new FileInputStream(file);
	                    fos = new FileOutputStream(temp);

	                    byte[] b = new byte[4096];
	                    int cnt = 0;
	                    while ((cnt = fis.read(b)) != -1) {
	                        // ���۸� ����Ͽ� ���� ������ �а� �����մϴ�.
	                        fos.write(b, 0, cnt);
	                    }
	                    BoardFileDTO dto = new BoardFileDTO();
	                    if(num!=0) {
	                    dto.setRef(num);
	                    dto.setFilename(file.getName());
	                    mapper.ApvalFileReg(dto);
	                    }
	                } catch (Exception e) {
	                    e.printStackTrace();
	                } finally {
	                    // FileInputStream�� FileOutputStream�� �ݽ��ϴ�.
	                    try {
	                        fis.close();
	                        fos.close();
	                    } catch (IOException e) {
	                        e.printStackTrace();
	                    }
	                }
	            }
	        }
	    }
	// ���� ���� ����
	    private void deleteFolder(String path) {
	        // �־��� ��ο� �ִ� ������ ������ ��������� �����ϴ� �Լ��Դϴ�.

	        File folder = new File(path);
	        try {
	            if (folder.exists()) {
	                File[] folder_list = folder.listFiles();
	                for (int i = 0; i < folder_list.length; i++) {
	                    if (folder_list[i].isFile())
	                        // ������ ���, ������ �����մϴ�.
	                        folder_list[i].delete();
	                    else
	                        // ������ ���, ��������� ���� ������ ���� �� ������ �����մϴ�.
	                        deleteFolder(folder_list[i].getPath());
	                    // �����̳� ������ �����մϴ�.
	                    folder_list[i].delete();
	                }
	                // ������ �����մϴ�.
	                folder.delete();
	            }
	        } catch (Exception e) {
	            e.getStackTrace();
	        }
	    }

	    // ��ġ������ ���� ���� �̸� ��������
	    private List<String> getFileNamesFromFolder(String folderName) {
	        // ���� �̸��� ������ ����Ʈ ����
	        List<String> fileNames = new ArrayList<>();

	        // �־��� ���� ��θ� ������� ���� ��ü ����
	        File folder = new File(folderName);
	        // ���� ���� ���ϵ��� ������
	        File[] files = folder.listFiles();
	        if (files != null) {
	            // ������ ��� ���� �̸��� ����Ʈ�� �߰�
	            for (File file : files) {
	                if (file.isFile()) {
	                    fileNames.add(file.getName());
	                }
	            }
	        }
	        // ���� �̸��� ���� ����Ʈ ��ȯ
	        return fileNames;
	    }

	    // ���� ���� ����
	    private void removeDummyFiles(List<String> fileNames, String filePath, String contents) {
	        // �־��� ���� �̸� ����Ʈ�� ������� ������ ����
	        for (String fileName : fileNames) {
	            // contents ���ڿ��� ���� �̸��� ���ԵǾ� ���� ���� ��� ���� ����
	            if (!contents.contains(fileName)) {
	                deleteFile(filePath, fileName);
	                mapper.deleteFileName(fileName);
	            }
	        }
	    }

	    // ���� �ϳ� ����
	    private void deleteFile(String filePath, String fileName) {
	        // �־��� ���� ��ο� �̸��� ������� ���� ��� ��ü ����
	        Path path = Paths.get(filePath, fileName);
	        try {
	            // ���� ����
	            Files.delete(path);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
		@Override
		public void ApprovalUpdate(String realPath, int num, Model model) {
			
				
		        // ���� ���� ���� ���� �Լ�
		        deleteFolder(realPath+"temp/");

		        // �Խñ� ����ҿ� �ִ� ���ϵ��� temp ���Ϸ� ���ε� 
		        // �Խñ� ������ �������� ������ ������� ���� �Խñ��� �̹����� �����ȴ�.
		        String path_folder1 = realPath + num + "/";
		        String path_folder2 = realPath + "temp/";
		        
		        // temp�� �ӽ�����
		        fileUpload(path_folder1, path_folder2,0);
		        EmpApprovalDTO board= mapper.getAppContent(num);
		        // ���ۿ��ִ� �̹��� ��θ� temp�� �ٲ��ش�
		        board.setContent(board.getContent().replaceAll(num + "/", "temp/"));
		        model.addAttribute("board", board);
		        // ...
		}
		@Override
		public void ApprovalUpdateReg(String realPath, int num, String title, String content,
				String id) {
				
				content = content.replaceAll("temp/", num+"/");

		        // ������ �ȵ� ���ϵ� ����(temp ����)
		        String filePath = realPath + "temp/";

		        // ���� ���� �����Լ� �Ű����� : ���� ���, ���� ���, �˻��� ����
		        removeDummyFiles(getFileNamesFromFolder(filePath), filePath, content);

		        // ������ ���� ����
		        filePath = realPath + num + "/";
		        for (String fileName : getFileNamesFromFolder(filePath)) {
		            deleteFile(filePath, fileName);
		            mapper.deleteFileAll(num);
		        }

		        // temp ���� ����� �����͵� ���ε�
		        String path_folder1 = realPath + "temp/";
		        String path_folder2 = realPath + num + "/";

		        fileUpload(path_folder1, path_folder2,num);
		        EmpApprovalDTO dto = new EmpApprovalDTO();
		        dto.setNo(num);
		        dto.setContent(content);
		        dto.setTitle(title);
		        dto.setWriter(id);
		        mapper.ApvalUpdate(dto);
		        deleteFolder(path_folder1);
		        
		}
		@Override
		public String ApprovalImgUpload(MultipartFile multipartFile, String realPath) {
			 JsonObject jsonObject = new JsonObject();

		        // �̹��� ������ ����� ��� ����
		        String contextRoot = realPath + "temp/";
		        String fileRoot = contextRoot;

		        // ���ε�� ������ ���� ���ϸ�� Ȯ���� ����
		        String originalFileName = multipartFile.getOriginalFilename();
		        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

		        // ���ο� ���ϸ� ���� (������ �ĺ��� + Ȯ����)
		        String savedFileName = UUID.randomUUID() + extension;

		        // ����� ������ ��ο� ���ϸ��� ��Ÿ���� File ��ü ����
		        File targetFile = new File(fileRoot + savedFileName);

		        try {
		            // ���ε�� ������ InputStream ���
		            java.io.InputStream fileStream = multipartFile.getInputStream();

		            // ���ε�� ������ ������ ��ο� ����
		            FileUtils.copyInputStreamToFile(fileStream, targetFile);

		            // JSON ��ü�� �̹��� URL�� ���� �ڵ� �߰�
		            jsonObject.addProperty("url", "/resources/file/ApprovalBoard/temp/" + savedFileName);
		            jsonObject.addProperty("responseCode", "success");
		        } catch (IOException e) {
		            // ���� ���� �� ������ �߻��� ��� �ش� ���� ���� �� ���� ���� �ڵ� �߰�
		            FileUtils.deleteQuietly(targetFile);
		            jsonObject.addProperty("responseCode", "error");
		            e.printStackTrace();
		        }

		        // JSON ��ü�� ���ڿ��� ��ȯ�Ͽ� ��ȯ
		        String a = jsonObject.toString();
		        return a;
		}
		@Override
		public void ApprovalImgDel(String fileName, String realPath) {

	        // ���� ��ġ
	        String filePath = realPath + "temp/";

	        // �ش� ���� ����
	        deleteFile(filePath, fileName);
		}
		@Override
		public void ApprovalList(Model model) {
			List<EmpApprovalDTO> list = mapper.ApvalList();
			model.addAttribute("list", list);
			System.out.println(list);
			
		}
		@Override
		public void ApprovalContent(Model model, int num) {
			EmpApprovalDTO dto= mapper.getAppContent(num);
			model.addAttribute("dto", dto);
		}
		@Override
		public void ApprovalDelete(int num) {
			mapper.deleteFileAll(num);
			mapper.ApvalDelete(num);
		}

}
