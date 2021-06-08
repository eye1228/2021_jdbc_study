<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	function update_go(f) {
		f.action="update.jsp";
		f.submit();
	}
	function delete_go(f) {
		f.action="delete.jsp";
		f.submit();
	}	
</script>
</head>
<body>
	<div>
	    <h2>개인 정보 보기</h2>
		<form  method="post">
			<table>
				<tbody>
					<tr>
						<th style="width: 40%">IDX</th><td>${vo2.idx }</td>
					</tr>
					<tr>
						<th>ID</th><td>${vo2.id }</td>
					</tr>
					<tr>
						<th>PW</th><td>${vo2.pw }</td>
					</tr>
					<tr>
						<th>NAME</th><td>${vo2.name }</td>
					</tr>
					<tr>
						<th>AGE</th><td>${vo2.age }</td>
					</tr>
					<tr>
						<th>ADDR</th><td>${vo2.addr }</td>
					</tr>
					<tr>
						<th>REG</th><td>${vo2.reg.substring(0,10) }</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
						    <input type="button" value="전체보기" onclick="list_go(this.form)">
						    <input type="button" value="수정" onclick="update_go(this.form)">
						    <input type="button" value="삭제" onclick="delete_go(this.form)">
						    <%-- 정보가 session 저장되어 있으므로 별도로 저장할 필요는 없다.
						          수정, 삭제를 위해서는 idx와 pw가 반드시 필요하다.  --%>
						</td>	
					</tr>
				</tfoot>				
			</table>
		</form>
	</div>
</body>
</html>