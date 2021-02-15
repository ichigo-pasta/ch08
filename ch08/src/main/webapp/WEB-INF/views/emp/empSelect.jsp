<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">직원 상세정보</h2>
		<table class="table table-bordered table-striped">
			<tr>
				<td>사번</td>
				<td>${emp.empno }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${emp.ename }</td>
			</tr>
			<tr>
				<td>업무</td>
				<td>${emp.job }</td>
			</tr>
			<tr>
				<td>관리자</td>
				<td>${emp.mgr }</td>
			</tr>
			<tr>
				<td>입사일</td>
				<td>${emp.hiredate }</td>
			</tr>
			<tr>
				<td>급여</td>
				<td>${emp.sal }</td>
			</tr>
			<tr>
				<td>보너스</td>
				<td>${emp.comm }</td>
			</tr>
			<tr>
				<td>부서코드</td>
				<td>${emp.deptno }</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="empList.do?deptno=${emp.deptno }" class="btn btn-info btn-xs">직원목록</a>
					<a href="empUpdateForm.do?empno=${emp.empno }" class="btn btn-warning btn-xs">수정</a>
					<a onclick="delConfirm()" class="btn btn-danger btn-xs">삭제</a>
					<a href="deptList.do" class="btn btn-success btn-xs">부서목록</a>
				</td>
		</table>
		<div id="empDisp"></div>
	</div>
	<script type="text/javascript">
		window.onpageshow = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("post", "empList.do", true);
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhr.send("deptno=${emp.deptno}");
			xhr.onload = function() {				
				if (xhr.status == 200 || xhr.status == 201) {
						document.getElementById('empDisp').innerHTML = xhr.response;
				} else {
					alert('요청오류: '+xhr.status);
				}
			}
			var xhr2 = new XMLHttpRequest();
			xhr2.open("get", "deptList.do?deptno=${emp.deptno}", true);
			xhr2.send(null);			
			xhr2.onload = function() {				
				if (xhr2.status == 200 || xhr2.status == 201) {
						document.getElementById('empDisp').innerHTML += xhr2.response;
				} else {
					alert('요청오류: '+xhr2.status);
				}
			}			
		}
		function delConfirm() {
			var con = confirm('정말로 삭제하시겠습니까?');
			if (con) location.href = "deleteEmp.do?empno=${emp.empno}&deptno=${emp.deptno}"
			else alert('삭제가 취소되었습니다');
		}
	</script>
</body>
</html>