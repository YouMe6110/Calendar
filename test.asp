<!DOCTYPE html>
<HEAD>
    <TITLE>캘린더</TITLE>
    <STYLE TYPE="text/css">
        ​ table {
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
	text-decoration: none;
	color: black;
}
a:visited {
	text-decoration: none;
	color: black;
}
a:hover {
	text-decoration: none;
	color: red;
}
</STYLE>
</HEAD>
<body>
    <%
​
myPath = Request.ServerVariables("PATH_INFO")
​
daysTxt=SPLIT("0,일,월,화,수,목,금,토",",")
​
daysColTxt=SPLIT("0,#CE5A67,#1F1717,#1F1717,#1F1717,#1F1717,#1F1717,#F4BF96",",")
​
monthsTxt=SPLIT("0,January,February,March,April,May,June,July,Agust,Septemper,October,Nobember,December",",")
​
Dim holiday(12,31)
holiday(1,1)="새해 첫날"
holiday(3,1)="삼일절"
holiday(4,8)="석가탄신일"
holiday(5,5)="어린이날"
holiday(6,6)="현충일"
holiday(7,17)="제헌절"
holiday(8,15)="광복절"
holiday(10,3)="개천절"
holiday(10,9)="한글날"
holiday(12,25)="성탄절"
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
    ​
    <TABLE Align="center" CellSpacing="0" CellPadding="5" Style="text-align:center;">
        <TR>
            <TH colspan=2>
                <A href="<%=myPath%>?y=<%=choYear-1%>&m=<%=choMonth%>">◀</A>
                <%= choYear %>
                <A href="<%=myPath%>?y=<%=choYear+1%>&m=<%=choMonth%>">▶</A>
            </TH>
            <TH colspan=3>
                <%
               IF choMonth=13 THEN
                   choMonth=1
                   choYear=choYear+1
               ELSEIF choMonth=0 THEN
                   choMonth=12
                   choYear=chYear-1
               END If
           %>
                <A href="<%=myPath%>?y=<%=choYear%>&m=<%=choMonth-1%>">◀</A>
                <%= monthsTxt(choMonth) %>(<%=choMonth%>)
                <A href="<%=myPath%>?y=<%=choYear%>&m=<%=choMonth+1%>">▶</A>
            </TH>
            <TH colspan=2><%= DateValue(now) %>
                <Button type="button" onclick="location.href='<%=myPath%>'">처음으로</Button></TH>
        </TR>
        <TR>
            <%  FOR d=1 TO UBOUND(daysTxt) STEP 1 %>
            <TH>
                <FONT color="<%=daysColTxt(d)%>"><%=daysTxt(d)%></FONT>
            </TH>
            <%  NEXT %>
        </TR>
        <%
           IF choMonth =2 THEN
               IF (choYear mod 4=0 AND choYear mod 100<>0) OR choYear mod 400=0 Then
                   months= 29
               ELSE
                   months=28
               END IF
           ELSEIF choMonth mod 2=0 THEN
               IF choMonth<8 Then
                   months=30
               ELSE
                   months=31
END IF    
           ELSE
               IF choMonth<8 THEN
                   months=31
                ELSE
                   months=30
               END IF    
           END IF
​
           startDay = WeekDay(DateSerial(choYear,choMonth,1))
           dim tdCnt
           tdCnt=1
​
           Dim strTwoTD
           strTwoTD="<TD></TD>"
           Response.Write "<TR>"
           IF 0 <>(startDay-1) THEN
                   for b=1 to startDay-1 step 1
                       tdCnt=tdCnt+1
                       Response.Write strTwoTD
                   NEXT
           END If
       %>
        <%
           Dim fntCol, eventDate, count
           FOR daily=1 TO months
               IF holiday(choMonth,daily)="" Then
                   fntCol = "black"
               ELSE    
                   fntCol = "red"
               END If
​
               IF tdCnt<8 THEN%>
        <TD><a href="list.asp?y=<%=choYear%>&m=<%=choMonth%>&d=<%=daily%>">
                <font color="<%=fntCol %>"><%=daily%></font>
        </TD></a>
        <%IF tdCnt=7 THEN
                       Response.Write "</TR>"
                   END IF
               ELSEIF tdCnt=8 OR tdCnt=15 OR tdCnt=22 OR tdCnt=29 THEN%>
        <TR>
            <TD><a href="list.asp?y=<%=choYear%>&m=<%=choMonth%>&d=<%=daily%>">
                    <font color="<%=fntCol %>"><%=daily%></font>
            </TD></a>
            <%ELSEIF tdCnt=14 OR tdCnt=21 OR tdCnt=28 OR tdCnt=35 THEN%>
            <TD><a href="list.asp?y=<%=choYear%>&m=<%=choMonth%>&d=<%=daily%>">
                    <font color="<%=fntCol %>"><%=daily%></font>
            </TD>
        <TR></a>
            <%ELSE%>
            <TD><a href="list.asp?y=<%=choYear%>&m=<%=choMonth%>&d=<%=daily%>">
                    <font color="<%=fntCol %>"><%=daily%></font>
            </TD></a>
            <%END IF
               tdCnt=tdCnt+1
           Next
       %>
            <%
           IF tdCnt<36 THEN
               FOR emp=1 TO 35-tdCnt STEP 1
                   Response.Write strTwoTD
               NEXT
               Response.Write strTwoTD&"</TR>"
           ELSEIF tdCnt>36 AND tdCnt<43 Then
               For emp=1 TO 42-tdCnt STEP 1
                   Response.Write strTwoTD
               NEXT
           END IF
       %>
    </TABLE>
</body>
</html>​
