<!DOCTYPE html>
<head>
   <title>글 수정</title>
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
<%
Dim postId
postId = Request("id")
​
Dim Dbcon
Dim Rs
Dim strConnect
strConnect = ""
Set Dbcon = Server.CreateObject("ADODB.Connection")
dbCon.open strConnect
​
Set Rs = Server.CreateObject("ADODB.RecordSet")
SQL = "SELECT * FROM cal WHERE idx=" & postId
Rs.Open SQL, Dbcon, , , adCmdText
​
Dim postContent
postContent = ""
If Not Rs.EOF Then
   postContent = Rs("title")
End If
​
Rs.Close
Dbcon.Close
Set Rs = Nothing
Set Dbcon = Nothing
%>
​
<TABLE border="1" Align="center" >
<form action="edit.asp?id=<%=postId %>" method="post">
	<tr>
       <td colspan="2" height=650>
			<textarea name="edited_content" rows="4" cols="50"><%=postContent %></textarea>
		</td>
   </tr>
	<tr>
       <td colspan="3" align=center>			
			<input type="submit" value="수정 완료">
</form>
		</td>
	</tr>
</TABLE>
</body>
</html>​
