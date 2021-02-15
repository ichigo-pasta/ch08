<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<form action="deptInsert.do" method="post" name="frm">
			<h2 class="text-primary">부서정보 입력</h2>
			<table class="table table-bordered">
				<tr>
					<td>부서코드</td>
					<td>
						<input type="number" name="deptno" required="required" autofocus="autofocus">
						<button type="button" onclick="deptnoChk()" class="btn btn-warning btn-xs">중복체크</button>
						<span id="disp" class="err"></span>
					</td>
				</tr>
				<tr>
					<td>부서명</td>
					<td><input type="text" name="dname" required="required"></td>
				</tr>
				<tr>
					<td>근무지</td>
					<td><input type="text" name="loc" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-success btn-sm">확인</button>
					</td>				
				</tr>
			</table>
		</form>
		<a href="deptList.do" class="btn btn-info">부서 목록</a>
	</div>
	<script type="text/javascript">
		function deptnoChk() {
			if (!frm.deptno.value) {
				alert("부서코드를 입력하세요");
				return false;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("post", "deptnoChk.do", true);
			xhr.onload = function() {				
				if (xhr.status == 200 || xhr.status == 201) {
						document.getElementById('disp').innerHTML = xhr.responseText;
				} else {
					alert('요청오류: '+xhr.status);
				}
			}
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.send("deptno="+frm.deptno.value);
		}
	</script>
</body>
</html>