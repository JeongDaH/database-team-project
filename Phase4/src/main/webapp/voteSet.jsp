<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>우리우정 012</title>
<link rel="stylesheet" href="./common.css" />
</head>
<body>
	<%
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "university";
	String pass = "comp322";
	String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;

	String query = "";
	Connection conn = null;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String deadline = request.getParameter("deadline");
	String datekey = request.getParameter("dk");
	String groupid = request.getParameter("gid");

	int voteK;
	try{
		String a = (String)session.getAttribute("voteK");
		voteK= Integer.parseInt(a);
	}
	catch(NumberFormatException e1)
	{
		voteK= 420;
	}
	query = "insert into vote values( ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(query);
	pstmt.setInt(1, voteK);
	pstmt.setString(2, title);
	pstmt.setString(3, deadline);
	pstmt.setString(4, datekey);
	pstmt.setString(5, groupid);
	int res=pstmt.executeUpdate();
	if (res>0) {
		System.out.println("insert성공");

	} else
		System.out.println("insert실패");

	String[] item=new String[4];
	item[0] = request.getParameter("item1");
	item[1] = request.getParameter("item2");
	item[2] = request.getParameter("item3");
	item[3] = request.getParameter("item4");
	
	int itemK=30+voteK;
	for(String s : item)
	{
		if(s.length()==0)
			continue;
		
		query = "insert into item values( ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, itemK);
		pstmt.setString(2, s);
		pstmt.setInt(3, voteK);
		res=pstmt.executeUpdate();
		if (res>0) {
			System.out.println("Iinsert성공");

		} else
			System.out.println("Iinsert실패");
		itemK+=1;
	}
	session.setAttribute("gid", groupid);
	voteK+=4;
	session.setAttribute("voteK", String.valueOf(voteK));
	
	//response.sendRedirect("searchview.jsp");
	response.sendRedirect("voteRecent.jsp");
	
	pstmt.close();
	conn.close();
	%>
</body>
</html>