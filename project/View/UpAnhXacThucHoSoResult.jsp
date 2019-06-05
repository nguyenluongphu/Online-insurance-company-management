<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
   		<c:forEach items = "${dsAnh }" var =  "ds">
   			<div class="col-md-6">
    			<div class="thumbnail">
         			<img src="${ds.getPath() }" alt="Lights" style="width:100%">
        		</div>
     		</div>
     	</c:forEach>
    </div>
</body>
</html>