<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert('수정 성공');
		location.href="empSelect.do?empno="+${emp.empno};
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert('수정 실패');
		history.go(-1);
	</script>
</c:if>