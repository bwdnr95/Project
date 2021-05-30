<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./inc/boardHead.jsp" />
<script type="text/javascript">
    function formValidate(f){
   	 if(f.title.value==""){
   		 alert("제목을 입력하세요");
   		 f.title.focus();
   		 return false;
   	 }
   	 if(f.category.value==""){
    		alert("카테고리를 선택해주세요");
   		 f.category.focus();
   		 return false;
   	 }
   	 if(f.price.value==""){
   		 alert("가격을 입력하세요");
   		 f.price.focus();
   		 return false;
   	 }
   	 if(f.content.value==""){
   		 alert("내용을 입력하세요");
   		 f.content.focus();
   		 return false;
   	 }
   	 if(f.oimg.value==""){
   		 alert("사진을 첨부해주세요");
   		 f.oimg.focus();
   		 return false;
   	 }
   	
    } 
</script>
<body>
<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="./inc/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>판매하기</h3>
			<form name="writeFrm" method="post" enctype="multipart/form-data"
    			action="../lendmark/write.do" onsubmit="return formValidate(this);">
					<div class="row mt-3 mr-1">
				<table class="table table-bordered table-striped">
				
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">제목</th>
						<td>
							<input type="text" class="form-control" name ="title" />
							
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">카테고리</th>
							<td>
								<select name="category" >
			                        <option value="">카테고리를 입력해주세요.</option>
			                        <option value="fassion">패션</option>
			                        <option value="sports">스포츠</option>
			                        <option value="electronics">전자제품</option>
			                        <option value="furniture">가구</option>
                   				</select>
							</td>
						
						
					</tr>
					<tr>
						<th class="text-center" 
							style="vertical-align:middle;">가격</th>
						<td>
							<input type="text" class="form-control" name ="price"
								style="width:200px;"/>
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">내용</th>
						<td>
							<textarea rows="10" 
								class="form-control" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">첨부사진</th>
						<td>
							<input type="file" class="form-control" name="oimg"/>
						</td>
					</tr>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<!-- <button type="button" class="btn btn-primary" 
						onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
					<!-- <button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button> -->
					<button type="submit" class="btn btn-danger">게시물작성</button>
					<button type="reset" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp';">리스트보기</button>
				</div>
			</div>
			</form>		
		
		</div>
	</div>
	<jsp:include page="./inc/boardBottom.jsp" />
</div>
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>
	아~~~~힘들다...ㅋ
 -->