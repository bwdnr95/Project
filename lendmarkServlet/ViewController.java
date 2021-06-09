package lendmarkServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lendmark/view.do")
public class ViewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idx = req.getParameter("idx");
		
		LendmarkDAO dao = new LendmarkDAO();
		dao.updateVisitCount(idx);
		LendmarkBoardDTO dto = dao.selectView(idx);
		LendmarkMemberDTO dto2 = dao.memberView(dto.getId());
		String addr = dto2.getAddr2();
		int cut = addr.indexOf("구");
		String address = addr.substring(0, cut);
		req.setAttribute("addr", address);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/lendmark/BoardView.jsp").forward(req, resp);
		
		
	}
}
