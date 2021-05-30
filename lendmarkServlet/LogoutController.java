package lendmarkServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/lendmark/logout.do")
public class LogoutController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		session.invalidate();
		
		JSFunction.alertLocation(resp, "로그아웃하셨습니다. 감사합니다", "../lendmark/LendmarkHomePage.jsp");
	}
}
