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
		<form action="deptUpdate.do" method="post" name="frm">
			<h2 class="text-primary">부서정보 수정</h2>
			<table class="table table-bordered">
				<tr>
					<td>부서코드</td>
					<td>
						<input type="number" name="deptno" readonly="readonly" value="${dept.deptno }" style="border: none; pointer-events: none">						
					</td>
				</tr>
				<tr>
					<td>부서명</td>
					<td><input type="text" name="dname" required="required" value="${dept.dname }" autofocus="autofocus"></td>
				</tr>
				<tr>
					<td>근무지</td>
					<td><input type="text" name="loc" required="required" value="${dept.loc }"></td>
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
</body>
</html>