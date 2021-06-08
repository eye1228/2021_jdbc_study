<%@page import="com.ict.db.DAO"%>
<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	request.setCharacterEncoding("utf-8");
    // 파라미터값이 VO에 속하면 VO객체를 생성해서 VO객체에 넣자 
    VO vo = new VO();
    vo.setId(request.getParameter("id"));
    vo.setPw(request.getParameter("pw"));
    
    // DB에 해당 id와 pw가 맞는지 검사 하자 
    VO vo2 = DAO.getInstance().getLogIn(vo);
    
    //jstl과 EL은 pageContext, request, session, application에 저장되어있어야 한다.
    // 로그인 정보는 기본적으로 session저장한다.
    session.setAttribute("vo2", vo2);
%> 
<c:choose>
	<c:when test="${empty vo2}">
	    <script>
	       var k = confirm("로그인 실패\n회원가입할까요?");
	       if(k){
	    	   location.href="join.jsp";
	       }else{
	    	   location.href="index.jsp";
	       }
	    </script>
	</c:when>
	<c:otherwise>
		 <script>
		 	alert("로그인 성공");
		 	location.href="onelist.jsp";
		 </script>
	</c:otherwise>
</c:choose>   
