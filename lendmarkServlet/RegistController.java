package lendmarkServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import utils.JSFunction;
@WebServlet("/lendmark/regist.do")
public class RegistController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("../lendmark/LendmarkRegistForm.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//폼값 받기
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String addr3 = req.getParameter("addr3");
		String ph_num1 = req.getParameter("ph_num1");
		String ph_num2 = req.getParameter("ph_num2");
		String ph_num3 = req.getParameter("ph_num3");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String ano_num1 = req.getParameter("ano_num1");
		String ano_num2 = req.getParameter("ano_num2");
		String ano_num3 = req.getParameter("ano_num3");
		//폼값과 로그인 아이디를 저장하기 위한 DTO객체
		LendmarkMemberDTO dto = new LendmarkMemberDTO();
		dto.setId(id);
		dto.setName(name);
		dto.setPass(pass);
		dto.setBirth(birth);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		dto.setAddr3(addr3);
		dto.setEmail1(email1);
		dto.setEmail2(email2);
		dto.setPh_num1(ph_num1);
		dto.setPh_num2(ph_num2);
		dto.setPh_num3(ph_num3);
		dto.setAno_num1(ano_num1);
		dto.setAno_num2(ano_num2);
		dto.setAno_num3(ano_num3);

		LendmarkDAO dao = new LendmarkDAO();




		int registResult = dao.LendmarkRegist(dto);
		dao.close();
		if(registResult==1){
			JSFunction.alertLocation(resp, "회원가입에 성공하셨습니다.", "../lendmark/LendmarkHomePage.jsp");
		}
		else{
			JSFunction.alertBack(resp,"회원가입에 실패하였습니다.");
		}
	}
}
