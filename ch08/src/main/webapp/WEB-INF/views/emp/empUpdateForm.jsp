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
		<h2 class="text-primary">직원정보 수정</h2>
		<form action="empUpdate.do" method="post" name="frm">
			<table class="table table-bordered">
				<tr>
					<td>사번</td>
					<td><input type="number" name="empno" readonly="readonly" style="border: none; pointer-events: none" value="${emp.empno }"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="ename" required="required" value="${emp.ename }" autofocus="autofocus"></td>
				</tr>
				<tr>
					<td>업무</td>
					<td><input type="text" name="job" required="required" value="${emp.job }"></td>
				</tr>
				<tr>
					<td>관리자 사번</td>
					<td>
						<select name="mgr">
					<c:forEach items="${empList }" var="e">
						<c:if test="${emp.mgr == e.empno }">
							<option value="${e.empno }" selected="selected">${e.ename }(${e.empno })</option>
						</c:if>
						<c:if test="${emp.mgr != e.empno }">
							<option value="${e.empno }">${e.ename }(${e.empno })</option>
						</c:if>							
						</c:forEach>						
						</select>
					</td>
				</tr>
				<tr>
					<td>입사일</td>
					<td><input type="date" name="hiredate" required="required" value="${emp.hiredate }"></td>
				</tr>
				<tr>
					<td>급여</td>
					<td><input type="number" name="sal" required="required" value="${emp.sal }"></td>
				</tr>
				<tr>
					<td>COMM</td>
					<td><input type="number" name="comm" required="required" value="${emp.comm }"></td>
				</tr>
				<tr>
					<td>부서코드</td>
					<td>
						<select name="deptno" required="required">
						<c:forEach items="${deptList }" var="dept">
						<c:if test="${dept.deptno == emp.deptno }">
							<option value="${dept.deptno }" selected="selected">${dept.dname }(${dept.deptno })</option>
						</c:if>
						<c:if test="${dept.deptno != emp.deptno }">
							<option value="${dept.deptno }">${dept.dname }(${dept.deptno })</option>						
						</c:if>
						</c:forEach>						
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-success">수정</button>
					</td>
			</table>
		</form>
		<a href="empList.do?deptno=${deptno }" class="btn btn-info">직원목록</a>
	</div>	
</body>
</html>