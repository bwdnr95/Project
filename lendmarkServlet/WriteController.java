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
@WebServlet("/lendmark/write1.do")
public class WriteController extends HttpServlet { 
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
		ArrayList sImg = new ArrayList();
		ArrayList oImg = new ArrayList();
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
			ImgUploadDTO dto2 = new ImgUploadDTO();
			
			LendmarkDAO dao = new LendmarkDAO();
			
			//서버에 저장된 파일명 변경하기
			Enumeration files = mr.getFileNames();
				
			List<ImgUploadDTO> bbs = new Vector<ImgUploadDTO>();
			
			while(files.hasMoreElements()) { 
			
				String fileName = (String)files.nextElement();
				sImg.add(mr.getFilesystemName(fileName));
				oImg.add(mr.getOriginalFileName(fileName));
			}
			System.out.println("sImg사이즈:"+sImg.size());
			System.out.println("oImg사이즈:"+oImg.size());
			
			
			Object firstImg = sImg.get(0);
			String firstNowTime = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			int firstExtIdx = ((String) firstImg).lastIndexOf(".");
			String firstNewFileName = firstNowTime + ((String) firstImg).substring(firstExtIdx,((String) firstImg).length());
			System.out.println(firstNewFileName);
			dto.setId(id);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setsImg(firstNewFileName);
			dto.setPrice(price);
			dto.setCategory(category);
			dto.setSellAvailable(sellAvailable);
			dto.setBargainAvailable(bargainAvailable);
			dto.setMinimumPeriod(minimumPeriod);
			if(maximumPeriod.equals(null)) {
				dto.setMaximumPeriod("90");
			}
			else {
				dto.setMaximumPeriod(maximumPeriod);
			}
			int result = dao.insertTrade(dto);
			String boardidx = dao.searchBoardidx(id, title);
			for(int i=0; i<sImg.size();i++) {
				if(index==0) {
					
				}
				String nowTime = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				int extIdx = ((String) sImg.get(i)).lastIndexOf(".");
				String newFileName = nowTime + ((String) sImg.get(i)).substring(extIdx,((String) sImg.get(i)).length());
				
				File oldImg = new File(saveDirectory+File.separator+((String) sImg.get(i)));
				File newImg = new File(saveDirectory+File.separator+newFileName);
				oldImg.renameTo(newImg);
				dto2.setBoardidx(boardidx);
				dto2.setId(id);
				dto2.setTitle(title);
				dto2.setoImg(((String) sImg.get(i)));
				dto2.setsImg(newFileName);
				
				bbs.add(dto2);
			
				System.out.println("bbs리스트 사이즈"+bbs.size());
				System.out.println("for문 index"+i);
				
			}
			int saveImgNum=dao.insertImg(bbs);
			
				//DAO에서 insert처리

				if(result==1) {
					if(saveImgNum==bbs.size()) {
						JSFunction.alertLocation(resp, "판매글 작성이 완료되었습니다.", "../lendmark/view.do?category="+category);
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
