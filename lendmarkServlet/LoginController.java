package lendmarkServlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;
@WebServlet("/lendmark/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("../lendmark/Login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		LendmarkDAO dao = new LendmarkDAO();
		
		String id = req.getParameter("user_id");
		String pass = req.getParameter("user_pw");
		String url = (String)session.getAttribute("url");
		Map<String,String> memberMap = dao.getMemberMap(id, pass);
		
		if(memberMap.get("id")!=null){
			//로그인에 성공하는 경우 session영역에 회원인증정보를 저장한다.
			session.setAttribute("USER_ID",memberMap.get("id"));
			session.setAttribute("USER_PW",memberMap.get("pw"));
			session.setAttribute("USER_NAME",memberMap.get("name"));
			//로그인 페이지로 이동
			if(url==null) {
				resp.sendRedirect("../lendmark/LendmarkHomePage.jsp");
			}
			else {
				resp.sendRedirect(url);
			}
		}
		else{
			JSFunction.alertLocation(resp, "아이디와 비밀번호를 확인해주세요.", "../lendmark/login.do");
		}
		
	
	}
}
