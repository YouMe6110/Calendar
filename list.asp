<!DOCTYPE html>
​
<HEAD>
   <TITLE>등록된 글</TITLE>
   <STYLE TYPE="text/css">
​
   table {
	width: 700px;
	height: 700px;
	border: 3px solid #1F1717;
	border-collapse: collapse;
}
th {
	width: 100px;
	border: 1px solid #1F1717;
	padding: 10px;
	background: #FCF5ED;
}
td {
	width: 100px;
	border: 1px solid #1F1717;
	padding: 10px;
}
a:link {
	text-decoration:none;
	color:black;
}
a:visited {
	text-decoration:none;
	color:black;
}
a:hover {
	text-decoration:none;
	color:red;
}
</STYLE>
</HEAD>
​
<body>
<%
​
choYear = Request("y")
choMonth = Request("m")
choDate = Request("d")
​
IF choYear = "" AND choMonth = "" AND choDate="" THEN
  nowDay = Weekday(now)
  choYear = Year(now)
  choMonth = Month(now)
  choDate = Day(now)
END If
​
%>
<TABLE Align="center" CellSpacing="0" CellPadding="5" Style="text-align:center;">
	<div style="margin:auto;text-align:center;">
​
	<form method="post" action="post.asp?y=<%=choYear%>&m=<%=choMonth%>&d=<%=choDate%>"">
       <input type="submit" value="작성하기"><br></br>
   </form>
<%
Response.CharSet = "EUC-KR"
choYear = Request("y")
choMonth = Request("m")
choDate = Request("d")
eventDetails = Request("eventDetails")
eventDate = choYear & "-" & choMonth & "-" & choDate
​
Dim Dbcon
Dim Rs
Dim strConnect
strConnect = ""
Set Dbcon = Server.CreateObject("ADODB.Connection")
dbCon.open strConnect
​
Set Rs = Server.CreateObject("ADODB.RecordSet")
SQL = "SELECT * FROM cal WHERE date='" & eventDate & "'"
Rs.Open sql,Dbcon, , ,adCmdText
​
If Rs.EOF Then
Response.Write "등록된 글이 없습니다."
Response.Write "<a href='test.asp'>돌아가기</a>"
​
Else
AllList = Rs.getrows()
Cnt = UBound(AllList, 2)
​
For i = 0 To Cnt
Response.Write "<td>" & AllList(0, i) & "</td><td>" & AllList(1, i) & "<td>" & AllList(2, i) & "</td><td><a href='edit_post.asp?id=" & AllList(0, i) & "'>수정</a></td>"&"<td><a href='delete.asp?id=" & AllList(0, i) & "'>삭제</a></td>" & "<tr>"
Next
​
END IF
​
'Do While Not Rs.EOF
'    Response.Write "<td>" & Rs(0) & "</td><td>" & Rs(1) & "<td>" & Rs(2) & "</td><td><a href='edit_post.asp?id=" & Rs(0) & "'>수정</a></td>"&"<td><a href='delete.asp?id=" & Rs(0) & "'>삭제</a></td>" & "<tr>"
'    Rs.MoveNext
'Loop
​
Set Rs = Nothing
Dbcon.Close
Set Dbcon = Nothing
%>
</div>
</TABLE>
</body>
</BODY>
</HTML>​
