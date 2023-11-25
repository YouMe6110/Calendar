<!DOCTYPE html>
<html>
<head>
   <title>수정</title>
</head>
<body>
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
eventDetails = Request("edited_content")
​
SQL = "UPDATE cal SET title = '" & eventDetails & "' WHERE idx = '" & id & "'"
​
dbCon.Execute SQL
Response.Write "수정되었습니다."
Response.Write "<a href='test.asp'>돌아가기</a>"
dbCon.Close
Set dbCon = Nothing
%>
</body>
</html>
