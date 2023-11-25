<!DOCTYPE html>
<html>
<head>
	<title>삭제</title>
<body>
​
<%
Response.CharSet = "EUC-KR"
choYear = Request("y")
choMonth = Request("m")
choDate = Request("d")
eventDetails = Request("eventDetails")
eventDate = choYear & "-" & choMonth & "-" & choDate
id = Request("id")
​
strConnect = ""
Set Dbcon = Server.CreateObject("ADODB.Connection")
dbCon.open strConnect
​
SQL = "DELETE FROM cal WHERE idx = " & id
​
dbCon.Execute SQL
Response.write "삭제되었습니다."
Response.Write "<a href='test.asp'>돌아가기</a>"
dbCon.close
Set dbCon = Nothing
%>
</body>
</html>
</head>​
