package lendmarkServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/lendmark/islogin.do")
public class isLogin extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("USER_ID");
		String url = (String)session.getAttribute("url");
		
		if(id==null) {
			JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "../lendmark/login.do");
			
		}
		else {
			if(url!=null) {
				
				JSFunction.alertLocation(resp, id+" 고객님 반갑습니다." , url);
			}
			else {
				JSFunction.alertLocation(resp, id+" 고객님 반갑습니다." , "../lendmark/LendmarkHomePage.jsp");
			}
		}
	}
	
}
