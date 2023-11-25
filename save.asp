<!DOCTYPE html>
<% Response.CharSet = "EUC-KR"%>
<html>
<head>
   <title>저장</title>
<body>
​
<%
choYear = Request("y")
choMonth = Request("m")
choDate = Request("d")
eventDetails = Request("eventDetails")
eventDate = choYear & "-" & choMonth & "-" & choDate
​
Set dbCon = Server.CreateObject("ADODB.Connection")
strConnect = ""
dbCon.open strConnect
​
SQL = "INSERT INTO cal(date, title) VALUES"
SQL = SQL & "('" & eventDate & "'"
SQL = SQL & ",'" & eventDetails & "')"
​
dbCon.Execute SQL
Response.write "저장되었습니다."
Response.Write "<a href='test.asp'>돌아가기</a>"
dbCon.close
Set dbCon = Nothing
%>
</body>
</html>
</head>
