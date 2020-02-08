<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	//비밀번호 확인 blur이벤트 발생이 동일여부 확인
	$("#password_2").blur(function(){
		let $p1 = $("#password_");
		let $p2 = $("#password_2");
		
		if($p1.val() != $p2.val()){
			alert("패스워드가 일치하지 않습니다.");
			$p1.select();
		}
	});
	//아이디 중복검사 이후 아이디를 변경한 경우
	$("#memberId_").change(function(){
		console.log($("#memberId_").val());
		$("#idValid").val(0);
	});
	
});

function enrollValidate(){
	let $memberId = $("#memberId_");
	if($memberId.val().length < 4){
		alert("아이디는 최소 4글자 이상입니다.");
		$memberId.select();
		return false;
	}
	
	let $idValid = $("#idValid");
	if($idValid.val() == 0){
		alert("중복검사 해주세요.");
		return false;
	}
	
	
	return true;
}

function checkIdDuplicate(){
	let memberId = $("#memberId_").val().trim();
	if(!memberId || memberId.length < 4){
		alert("아이디는 4글자이상 작성하세요.");
		return;
	}
	
	let title  = "checkIdDuplicate";//팝업과 폼을 연결
	let popup = open("", title, "left=500px, top=100px, width=300px, height=200px");
	
	let frm = document.checkIdDuplicateFrm;
	frm.action = "<%=request.getContextPath()%>/member/checkIdDuplicate";
	frm.method = "post";
	frm.target = title;
	frm.memberId.value = memberId;
	frm.submit();
	
	
}


</script>

<!-- 아이디 중복체크  폼 -->
<form name="checkIdDuplicateFrm">
	<input type="hidden" name="memberId" />
</form>
<section id=enroll-container>
    <h2>회원 가입 정보 입력</h2>
    <form action="<%=request.getContextPath() %>/member/memberEnrollEnd" 
    	  name="memberEnrollFrm" 
    	  method="post" 
    	  onsubmit="return enrollValidate();" >
      <table>
				<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" required>
					<input type="button" 
						   onclick="checkIdDuplicate();" 
						   value="중복검사"/>
					<input type="hidden" name="idValid" id="idValid" value="0" />
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="password" id="password_" required><br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" id="password_2" required><br>
				</td>
			</tr>  
			<tr>
				<th>이름</th>
				<td>	
				<input type="text"  name="memberName" id="memberName" required><br>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>	
				<input type="date" name="birthDay" id="birthDay"><br>
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email"><br>
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" placeholder="" name="address" id="address"><br>
				</td>
			</tr>
			<tr>
				<th>성별 </th>
				<td>
					<input type="radio" name="gender" id="gender0" value="M" checked>
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F">
					<label for="gender1">여</label>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="가입" >
		<input type="reset" value="취소">
      </form>
  </section>
  
