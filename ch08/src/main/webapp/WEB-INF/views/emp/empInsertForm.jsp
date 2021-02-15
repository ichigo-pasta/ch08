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
		<h2 class="text-primary">직원정보 입력</h2>
		<form action="empInsert.do" method="post" name="frm">
			<table class="table table-bordered">
				<tr>
					<td>사번</td>
					<td>
						<input type="number" name="empno" required="required" autofocus="autofocus">
						<button type="button" onclick="empChk()" class="btn btn-warning btn-xs">중복체크</button>
						<span id="empCheck" class="err"></span>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="ename" required="required"></td>
				</tr>
				<tr>
					<td>업무</td>
					<td><input type="text" name="job" required="required"></td>
				</tr>
				<tr>
					<td>관리자 사번</td>
					<td>
						<select name="mgr">
						<c:forEach items="${empList }" var="emp">
							<option value="${emp.empno }">${emp.ename }(${emp.empno })</option>
						</c:forEach>						
						</select>
					</td>
				</tr>
				<tr>
					<td>입사일</td>
					<td><input type="date" name="hiredate" required="required"></td>
				</tr>
				<tr>
					<td>급여</td>
					<td><input type="number" name="sal" required="required"></td>
				</tr>
				<tr>
					<td>COMM</td>
					<td><input type="number" name="comm" required="required"></td>
				</tr>
				<tr>
					<td>부서코드</td>
					<td>
						<select name="deptno" required="required">
						<c:forEach items="${deptList }" var="dept">
						<c:if test="${dept.deptno == deptno }">
							<option value="${dept.deptno }" selected="selected">${dept.dname }(${dept.deptno })</option>
						</c:if>
						<c:if test="${dept.deptno != deptno }">
							<option value="${dept.deptno }">${dept.dname }(${dept.deptno })</option>						
						</c:if>
						</c:forEach>						
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-success">입력</button>
					</td>
			</table>
		</form>
		<a href="empList.do?deptno=${deptno }" class="btn btn-info">직원목록</a>
	</div>
	<script type="text/javascript">
		function empChk() {
			if (!frm.empno.value) {
				alert('사번을 입력하세요');
				frm.empno.focus();
				return false;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("get", "empChk.do?empno="+frm.empno.value, true);
			xhr.onload = function() {				
				if (xhr.status == 200 || xhr.status == 201) {
						document.getElementById('empCheck').innerHTML = xhr.responseText;
				} else {
					alert('요청오류: '+xhr.status);
				}
			}			
			xhr.send(null);
		}
	</script>
</body>
</html>