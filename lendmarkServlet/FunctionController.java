package lendmarkServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
@WebServlet("*.function")
public class FunctionController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		if(commandStr=="/heart.function") {
			heartCount(req,resp);
		}
	}
	private void heartCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		JSONObject json = new JSONObject();
		LendmarkDAO dao = new LendmarkDAO();
		int heartPlus = 0;
		String idx = req.getParameter("idx");
		String id =(String)session.getAttribute("USER_ID");
		
		heartPlus = dao.heartCountCheck(idx, id);
		if(heartPlus==1) {
			dao.heartCountPlus(idx);
			json.put("result",1);
		}
		else{
			dao.heartCountMinus(idx);
			json.put("result",0);
		}
		int totalHeart = dao.totalHeart(idx);
		json.put("totalHeart",totalHeart);
		dao.close();
		System.out.println(json.toString());
	}
		
	
}
