package lendmarkServlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartFilter;
import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;
@WebServlet("/lendmark/write.do")
public class WriteController2 extends HttpServlet { 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id= (String)session.getAttribute("USER_ID");
		session.setAttribute("url", "../lendmark/NewSellPage2.jsp");
		if(id==null) {
			JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "../lendmark/login.do");
		}
		else {
			session.removeAttribute("url");
			req.getRequestDispatcher("/lendmark/NewSellPage2.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int index =0;
		//서블릿에서 디렉토리의 물리적경로 얻어오기
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		//서블릿에서 컨텍스트 초기화 파라미터 얻어오기
		ServletContext application = this.getServletContext();
		//파일 업로드 제한 용량
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"))*5;
		//파일 업로드 처리
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if(mr!=null) {
			//파일 외 파라미터 받기
			HttpSession session = req.getSession();
			String id= (String)session.getAttribute("USER_ID");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String price = mr.getParameter("price");
			String category = mr.getParameter("category");
			String sellAvailable = mr.getParameter("buy-radio");
			String bargainAvailable = mr.getParameter("bargain-avail");
			String minimumPeriod = mr.getParameter("minimumPeriod");
			String maximumPeriod = mr.getParameter("maximumPeriod");
			
			LendmarkBoardDTO dto = new LendmarkBoardDTO();
			
			
			LendmarkDAO dao = new LendmarkDAO();
			
			//서버에 저장된 파일명 변경하기
			
			//files는 객체가 저장된 input type=file의 name값을 반환한다.
			Enumeration files = mr.getFileNames();
				
			List<ImgUploadDTO> bbs = new Vector<ImgUploadDTO>();
			int result =0;
			String boardidx = null;
			while(files.hasMoreElements()) { 
				ImgUploadDTO dto2 = new ImgUploadDTO();
				String tagName = (String)files.nextElement();
				System.out.println(tagName);
				String fileName = mr.getFilesystemName(tagName);
				System.out.println(fileName);
				String nowTime = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				int extIdx = fileName.lastIndexOf(".");
				System.out.println(extIdx);
				String newFileName = nowTime + fileName.substring(extIdx,fileName.length());
				
				File oldImg = new File(saveDirectory+File.separator+fileName);
				File newImg = new File(saveDirectory+File.separator+newFileName);
				oldImg.renameTo(newImg);
				
				if(index==0) {
					dto.setId(id);
					dto.setTitle(title);
					dto.setContent(content);
					dto.setsImg(newFileName);
					dto.setPrice(price);
					dto.setCategory(category);
					dto.setSellAvailable(sellAvailable);
					dto.setBargainAvailable(bargainAvailable);
					dto.setMinimumPeriod(minimumPeriod);
					dto2.setId(id);
					dto2.setTitle(title);
					dto2.setoImg(fileName);
					System.out.println("dto2에 저장되는 fileName :" +fileName);
					dto2.setsImg(newFileName);
					System.out.println("dto2에 저장되는 newFileName :" +newFileName);
					if(maximumPeriod=="") {
						dto.setMaximumPeriod("90");
					}
					else {
						dto.setMaximumPeriod(maximumPeriod);
					}
					result = dao.insertTrade(dto);
					boardidx = dao.searchBoardidx(id, title);
					dto2.setBoardidx(boardidx);
					bbs.add(dto2);
					System.out.println(bbs.size());
				}
				else {
					dto2.setBoardidx(boardidx);
					dto2.setId(id);
					dto2.setTitle(title);
					dto2.setoImg(fileName);
					dto2.setsImg(newFileName);
					
					bbs.add(dto2);
				}
				index++;
			}
			

			int saveImgNum=dao.insertImg(bbs);
			
				//DAO에서 insert처리

				if(result==1) {
					if(saveImgNum==bbs.size()) {
						dao.postPlus(id);
						JSFunction.alertLocation(resp, "판매글 작성이 완료되었습니다.", "../lendmark/view.do?idx="+boardidx);
					}
					else {
						JSFunction.alertLocation(resp, "서버에 이미지 저장 중 오류가 발생하였습니다", "../lendmark/write.do");
					}
				}
				else {
					JSFunction.alertLocation(resp, "글 작성 중 오류가 발생하였습니다.", "../lendmark/write.do");
				}
			}
			else {
				//파일 첨부를 위한 객체 생성이 안된 경우
				JSFunction.alertLocation(resp, "글 작성 중 오류가 발생하였습니다.", "../lendmark/write.do");
			}
		
	}
}
