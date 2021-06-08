<%@page import="com.ict.db.DAO"%>
<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	request.setCharacterEncoding("utf-8");
    String idx = request.getParameter("idx");
    
    VO vo = DAO.getInstance().getDetail(idx);
    pageContext.setAttribute("vo", vo);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보보기</title>
<style type="text/css">
   div{text-align: center; margin: 100px; auto;}
   table, th,td{
	    padding : 10px 5px;
	    border: 1px solid black;
	    border-collapse: collapse;
	    width: 500px;
	    margin: auto;
   }	
   input{
      padding : 10px;
   }
</style>
<script type="text/javascript">
	function list_go(f) {
		f.action="list.jsp";
		f.submit();
	}
	function update_ok(f) {
	  if("${param.pw}"==f.pw.value){
		  f.action="update_ok.jsp";
		  f.submit();
	  }else{
		  alert("비밀번호틀림");
		  f.pw.value="";
		  f.pw.focus();
		  return;
	  }
	}	
</script>
</head>
<body>
	<div>
	    <h2>개인 정보 수정</h2>
		<form  method="post">
			<table>
				<tbody>
					<tr>
						<th style="width: 40%">IDX</th>
						<td><input type="text" name="idx" value="${vo.idx }" readonly></td>
					</tr>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" value="${vo.id }" readonly></td>
					</tr>
					<tr>
						<th>PW</th>
						<td><input type="password" name="pw"  ></td>
					</tr>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" value="${vo.name }"></td>
					</tr>
					<tr>
						<th>AGE</th>
						<td><input type="number" name="age" value="${vo.age }"></td>
					</tr>
					<tr>
						<th>ADDR</th>
						<td><input type="text" name="addr" value="${vo.addr}"></td>
					</tr>
					<tr>
						<th>REG</th>
						<td><input type="text" name="reg" value="${vo.reg.substring(0,10) }" readonly></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
						    <input type="button" value="전체보기" onclick="list_go(this.form)">
						    <input type="button" value="수정" onclick="update_ok(this.form)">
						</td>	
					</tr>
				</tfoot>				
			</table>
		</form>
	</div>
</body>
</html>