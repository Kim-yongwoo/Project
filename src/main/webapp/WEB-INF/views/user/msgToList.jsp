<%@ page import="yw.basket.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="yw.basket.util.CmmUtil" %>
<%

//전달받은 메시지
String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
    String url = CmmUtil.nvl((String)request.getAttribute("url"));

%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>처리페이지</title>
<script type="text/javascript">

	alert("<%="회원가입이 완료되었습니다"%>");
	top.location.href="<%=url%>";
		
</script>
</head>
<body>

</body>
</html>