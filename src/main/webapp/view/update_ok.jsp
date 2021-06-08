<%@page import="com.ict.db.DAO"%>
<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("utf-8");
    VO vo = new VO();
    vo.setIdx(request.getParameter("idx"));
    // vo.setId(request.getParameter("id"));
    // vo.setPw(request.getParameter("pw"));
    vo.setName(request.getParameter("name"));
    vo.setAge(request.getParameter("age"));
    vo.setAddr(request.getParameter("addr"));
    // vo.setReg(request.getParameter("req"));
    
    int result = DAO.getInstance().getUpdate(vo); 
    response.sendRedirect("detail.jsp?idx="+vo.getIdx());
%>

