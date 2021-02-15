<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- path: ch06 절대경로를 만들기 위해 사용 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	.err {color: red; font-weight: bold}
	input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
</style>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>