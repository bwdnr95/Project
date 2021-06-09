package lendmarkServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/lendmark/advertising.do")
public class AdvertisingController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("USER_ID");
		System.out.println(id);
		if(id!=null) {
			LendmarkDAO dao = new LendmarkDAO();
			LendmarkMemberDTO dto = dao.memberView(id);
			session.setAttribute("dto", dto);
		}
		resp.sendRedirect("../lendmark/advertiseView.jsp");
		 
		
	}
}
