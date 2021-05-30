package lendmarkServlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;
@WebServlet("/lendmark/write.do")
public class WriteController extends HttpServlet { 

	/*
	 글쓰기 페이지로 진입시에는 get방식 요청
	 */
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id= (String)session.getAttribute("USER_ID");
		session.setAttribute("url", "../lendmark/BoardWrite.jsp");
		if(id==null) {
			JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "../lendmark/login.do");
		}
		else {
			session.removeAttribute("url");
			req.getRequestDispatcher("/lendmark/BoardWrite.jsp").forward(req, resp);
			
		}
	
	}
	/*
	 글쓰기 내용 입력 후 전송했을 때는 post방식 요청
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//서블릿에서 디렉토리의 물리적경로 얻어오기
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		//서블릿에서 컨텍스트 초기화 파라미터 얻어오기
		ServletContext application = this.getServletContext();
		//파일 업로드 제한 용량
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		//파일 업로드 처리
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if(mr!=null) {
			//파일 외 파라미터 받기
			String id = mr.getParameter("id");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String price = mr.getParameter("price");
			String category = mr.getParameter("category");
		
			
			
			LendmarkBoardDTO dto = new LendmarkBoardDTO();
			dto.setId(id);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setPrice(price);
			dto.setCategory(category);
			//서버에 저장된 파일명 변경하기
			String fileName = mr.getFilesystemName("oimg");
			if(fileName!=null) {
				String nowTime = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				int extIdx = fileName.lastIndexOf(".");
				String newFileName = nowTime + fileName.substring(extIdx,fileName.length());
				
				File oldImg = new File(saveDirectory+File.separator+fileName);
				File newImg = new File(saveDirectory+File.separator+newFileName);
				oldImg.renameTo(newImg);
				
				dto.setOimg(fileName);
				dto.setSimg(newFileName);
			}
				//DAO에서 insert처리
				LendmarkDAO dao = new LendmarkDAO();
				int result = dao.insertTrade(dto);
				if(result==1) {
					resp.sendRedirect("../lendmark/list.do");
				}
				else {
					resp.sendRedirect("../lendmark/write.do");
				}
			}
			else {
				//파일 첨부를 위한 객체 생성이 안된 경우
				JSFunction.alertLocation(resp, "글 작성 중 오류가 발생하였습니다.", "../lendmark/write.do");
			}
		
	}
}
