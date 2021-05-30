package lendmarkServlet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectionPool;

public class LendmarkDAO extends ConnectionPool {

   public LendmarkDAO() {
      super();
   }
   //게시물의 갯수 카운트
   public int selectCount(Map<String, Object> map) {
      int totalCount = 0;
      String query = "SELECT COUNT(*) FROM lendmarklist";
      if(map.get("searchWord")!=null) {
         query += " WHERE (category " +" "
               + " LIKE '%"+ map.get("searchWord") +"%' "
         	   + " OR  content LIKE '%"+map.get("searchWord") +"%' ";
      }
      try {
         stmt = con.createStatement();
         rs = stmt.executeQuery(query);
         rs.next();
         totalCount = rs.getInt(1);
      } catch (Exception e) {
         System.out.println("게시물 카운트중 예외발생");
         e.printStackTrace();
      }
      return totalCount;
   }
   
   public List<LendmarkBoardDTO> selectListPage(Map<String, Object> map){
      List<LendmarkBoardDTO> bbs = new Vector<LendmarkBoardDTO>();
      
      String query = " "
            +" SELECT * FROM ( "
            +"   SELECT * FROM lendmarklist ";
      if(map.get("searchWord")!=null) {
         query += " WHERE (category " +" "
                 + " LIKE '%"+ map.get("category") +"%' "
           	   + " OR  content LIKE '%"+map.get("searchWord") +"%' ";
      }
      query += " "
            +"   ORDER BY idx DESC "
            +") ";
      try {
         psmt = con.prepareStatement(query);
         rs = psmt.executeQuery();
         while(rs.next()) {
            LendmarkBoardDTO dto = new LendmarkBoardDTO();
            dto.setIdx(rs.getString(1));
		    dto.setId(rs.getString(2));
		    dto.setTitle(rs.getString(3));
		    dto.setCategory(rs.getString(4));
		    dto.setContent(rs.getString(5));
		    dto.setPostdate(rs.getDate(6));
		    dto.setOimg(rs.getString(7));
		    dto.setSimg(rs.getString(8));
		    dto.setHeart(rs.getString(9));
		    dto.setChattime(rs.getString(10));
		    dto.setVisitcount(rs.getString(11));
            
            bbs.add(dto);
         }
      } catch (Exception e) {
         System.out.println("게시물 조회중 예외 발생");
         e.printStackTrace();
      }
      return bbs;
   }
   public int insertTrade(LendmarkBoardDTO dto) {
		int result =0;
		try {
			String query = "INSERT INTO lendmarklist ("
						+ " idx,id,title,content,category,oimg,simg)"
						+" VALUES ("
						+" seq_lendlist_num.NEXTVAL, ?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getCategory());
			psmt.setString(5, dto.getOimg());
			psmt.setString(6, dto.getSimg());
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
   public LendmarkBoardDTO selectView(String idx) {
	   LendmarkBoardDTO dto = new LendmarkBoardDTO();
	   String query = "SELECT * FROM lendmarklist WHERE idx=?";
	   try {
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, idx);
		   rs = psmt.executeQuery();
		   if(rs.next()) {
			   dto.setIdx(rs.getString(1));
			   dto.setId(rs.getString(2));
			   dto.setTitle(rs.getString(3));
			   dto.setCategory(rs.getString(4));
			   dto.setContent(rs.getString(5));
			   dto.setPostdate(rs.getDate(6));
			   dto.setOimg(rs.getString(7));
			   dto.setSimg(rs.getString(8));
			   dto.setHeart(rs.getString(9));
			   dto.setChattime(rs.getString(10));
			   dto.setVisitcount(rs.getString(11));
		   }
	   }
	   catch(Exception e) {
		   System.out.println("게시물 상세보기 중 예외발생");
		   e.printStackTrace();
	   }
	   return dto;
   }
   public void updateVisitCount(String idx) {
	      String query = "UPDATE mvcboard SET "
	            + " visitcount=visitcount+1 "
	            + " WHERE idx=?";
	      try {
	         psmt = con.prepareStatement(query);
	         psmt.setString(1, idx);
	         psmt.executeQuery();
	         
	      } catch (Exception e) {
	         System.out.println("방문자수 증가에러 발생");
	         e.printStackTrace();
	      }
   }
    public boolean confirmPassword(String idx, String pass) {
	      boolean result = false;
	      //일련번호와 패스워드가 일치하는 게시물이 있는지 확인
	      String query = " SELECT COUNT(*) FROM mvcboard "
	            + " WHERE idx=? AND pass=? ";
	      try {
		        psmt = con.prepareStatement(query);
		        psmt.setString(1, idx);
		        psmt.setString(2, pass);
		        rs = psmt.executeQuery();
		         
		        rs.next();
		         //삼항연산자 사용해서 결정
		        if(rs.getInt(1)==1) {
		        	result = true;
		        }
	         } 
	         catch (Exception e) {
	         //검증에 실패하면 false 처리 해줘야함
	         result = false;
	         System.out.println("패스워드 검증 에러발생");
	         e.printStackTrace();
	      }
	      
	      return result;
    }
    //수정처리
    public int updatePost(LendmarkBoardDTO dto) {
    	int result = 0;
    	try {
    		//비회원제 게시판이므로 패스워드까지 where절에 추가함.
    		String query = "UPDATE lendmarklist SET "
    				+ " title=?, category=?, content=?, oimg=?, simg=?, postdate = to_char(sysdate,'hh24:mi:ss')  "
    				+ " WHERE idx=? ";
    		psmt = con.prepareStatement(query);
    		psmt.setString(1, dto.getTitle());
    		psmt.setString(2, dto.getCategory());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOimg());
			psmt.setString(5, dto.getSimg());
			psmt.setString(6, dto.getIdx());
			result = psmt.executeUpdate();
    	}
    	catch(Exception e) {
    		System.out.println("게시물 수정 중 예외발생");
    		e.printStackTrace();
    	}
    	return result;
    }
    public int deletePost(String idx) {
        int result = 0;
        try {
           //비밀번호 검증 후 즉시 삭제하므로 비밀번호는 제외한다.
           String query = "DELETE FROM lendmarklist WHERE idx=?";
           psmt = con.prepareStatement(query);
           psmt.setString(1, idx);
           result = psmt.executeUpdate();
        }
        catch(Exception e) {
           System.out.println("게시물 삭제중 예외발생");
           e.printStackTrace();
        }
        return result;
     }
    public void heartCountPlus(String idx) {
        String query = "UPDATE lendmarklist SET "
	            + " heart=heart+1 "
	            + " WHERE idx=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            psmt.executeQuery();
	         
	      	} 
         catch (Exception e) {
	         
        }
    }
    
    public int MemberRegist(LendmarkMemberDTO dto) {
		int result =0;
		try {
			//인파라미터가 있는 insert 쿼리문 작성
			String query = "INSERT INTO lendmarkmember ("
						+ " id,pass,name,birth,addr1,addr2,addr3,email1,email2,ph_num1,ph_num2, "
						+ " ph_num3,ano_num1,ano_num2,ano_num3) "
						+" VALUES ("
						+" ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			//prepare객체 생성 후 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getAddr1());
			psmt.setString(6, dto.getAddr2());
			psmt.setString(7, dto.getAddr3());
			psmt.setString(8, dto.getEmail1());
			psmt.setString(9, dto.getEmail2());
			psmt.setString(10, dto.getPh_num1());
			psmt.setString(11, dto.getPh_num2());
			psmt.setString(12, dto.getPh_num3());
			psmt.setString(13, dto.getAno_num1());
			psmt.setString(14, dto.getAno_num2());
			psmt.setString(15, dto.getAno_num3());
			//쿼리문 실행
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("회원정보 입력중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public LendmarkMemberDTO memberView(String id) {
		
		LendmarkMemberDTO dto = new LendmarkMemberDTO();
		
		String query = "SELECT * " +
				" FROM lendmarkmember " +
				" WHERE id=?";
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			/*
			 매개변수로 전달된 일련번호를 통해 조회하므로
			 결과는 무조건 1개만 나오게 된다. 따라서 if문으로
			 반환된 결과가 있는지만 확인하면 된다.
			* */
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAddr3(rs.getString("addr3"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setPh_num1(rs.getString("Ph_num1"));
				dto.setPh_num2(rs.getString("Ph_num2"));
				dto.setPh_num3(rs.getString("Ph_num3"));
				dto.setAno_num1(rs.getString("Ano_num1"));
				dto.setAno_num2(rs.getString("Ano_num2"));
				dto.setAno_num3(rs.getString("Ano_num3"));
				dto.setRegidate(rs.getDate("regidate"));
			}
		}
		catch(Exception e) {
			System.out.println("회원정보 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	public int LendmarkRegist(LendmarkMemberDTO dto) {
		int result =0;
		try {
			//인파라미터가 있는 insert 쿼리문 작성
			String query = "INSERT INTO lendmarkmember ("
						+ " id,pass,name,birth,addr1,addr2,addr3,email1,email2,ph_num1,ph_num2, "
						+ " ph_num3,ano_num1,ano_num2,ano_num3) "
						+" VALUES ("
						+" ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			//prepare객체 생성 후 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getAddr1());
			psmt.setString(6, dto.getAddr2());
			psmt.setString(7, dto.getAddr3());
			psmt.setString(8, dto.getEmail1());
			psmt.setString(9, dto.getEmail2());
			psmt.setString(10, dto.getPh_num1());
			psmt.setString(11, dto.getPh_num2());
			psmt.setString(12, dto.getPh_num3());
			psmt.setString(13, dto.getAno_num1());
			psmt.setString(14, dto.getAno_num2());
			psmt.setString(15, dto.getAno_num3());
			//쿼리문 실행
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("회원정보 입력중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public int overapping(String id) {
		int result = 0;
		String query = " "
				+ "SELECT id FROM lendmarkmember "
				+ " WHERE id= ? ";
		System.out.println("페이지쿼리:"+query);
		try {
			psmt=con.prepareStatement(query);
			//between절의 start와 end값을 인파라미터 설정
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public Map<String,String> getMemberMap(String uid, String upass){
		
		Map<String, String> map = new HashMap<String, String>();
		
		String query = "SELECT id, pass FROM lendmarkmember "
	            + " WHERE id=? AND pass=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2,upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				map.put("id", rs.getString(1));
				map.put("pw", rs.getString(2));
			}
		}
		catch(Exception e) {
			System.out.println("getMemberMap오류");
			e.printStackTrace();
		}
		//Map컬렉션에 저장된 회원정보 반환
		return map;
	}
}
