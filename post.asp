<!DOCTYPE html>
​
<%
Response.CharSet = "EUC-KR"
choYear = Request("y")
choMonth = Request("m")
choDate = Request("d")
%>
​
<head>
   <meta charset="UTF-8">
   <title>일정 등록</title>
	<STYLE TYPE="text/css">
​
   table {
	width: 700px;
	height: 700px;
	border: 3px solid #1F1717;
	background: #FCF5ED;
	border-collapse: collapse;
}
​
	textarea {
	width: 685px;
	height: 640px;
}
</STYLE>
</head>
<body>
	<form method = "post" action = "save.asp">
	<input type = "hidden" name = "y" value = "<%=choYear%>">
	<input type = "hidden" name = "m" value = "<%=choMonth%>">
	<input type = "hidden" name = "d" value = "<%=choDate%>">
   <TABLE border="1" Align="center" >
       <tr>
           <td colspan="2" height=650>
               <textarea name = "eventDetails" placeholder="내용을 입력하세요." style="resize: none;"></textarea>
           </td>
       </tr>
       <tr>
           <td colspan="3" align=center>				
			<input type="submit" value="등록">
			<input type="button" onclick="window.history.back()" value="뒤로가기">
		</td>
		</tr>
	</TABLE>
	</form>
</body>
</html>
