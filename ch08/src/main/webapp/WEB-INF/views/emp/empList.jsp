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
		<h2>${dept.dname } 직원 목록</h2>
		<table class="table table-striped">
			<tr>
				<td>사번</td>
				<td>이름</td>
				<td>업무</td>
				<td>입사일</td>
			</tr>
		<c:if test="${empty empList }">
			<tr>
				<td colspan="4">직원이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty empList }">
			<c:forEach items="${empList }" var="emp">
			<tr>
				<td>${emp.empno }</td>
				<td><a class="btn btn-info btn-xs" href="empSelect.do?empno=${emp.empno }">${emp.ename }</a></td>
				<td>${emp.job }</td>
				<td><fmt:formatDate value="${emp.hiredate }" pattern="yyyy년 MM월 dd일" /></td>
			</tr>
			</c:forEach>
		</c:if>
		</table>
		<a href="deptList.do" class="btn btn-info">부서 목록</a>
		<a href="empInsertForm.do?deptno=${dept.deptno }" class="btn btn-warning">직원 정보 입력</a>
		<div id="disp"></div>
	</div>
	<script type="text/javascript">		
		window.onpageshow = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("get", "deptList.do", true);
			xhr.onload = function() {				
				if (xhr.status == 200 || xhr.status == 201) {
						document.getElementById('disp').innerHTML = xhr.responseText;
				} else {
					alert('요청오류: '+xhr.status);
				}
			}			
			xhr.send(null);
		}
	</script>
</body>
</html>