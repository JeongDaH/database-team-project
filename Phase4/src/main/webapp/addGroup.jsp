<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�츮���� 012</title>
</head>
<body>	
	<%
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "university";
	String pass = "comp322";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	
	Connection conn = null;
	PreparedStatement pstmt;
	Statement stmt = null;

	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	stmt = conn.createStatement();
	String group_id = request.getParameter("group_id");
	String password = request.getParameter("password");
	String date = request.getParameter("date");
	String createdAt = "To_date('" + date + "', 'yyyy-mm-dd')";
	String user_id = "hyejjang";
	String sql = "";
	
	try {
		// Let's execute an SQL statement.
		sql = "INSERT INTO Calendar VALUES ('" + group_id + "'," + createdAt + ",'" + password + "')";
		System.out.println(sql);
		
		int res = stmt.executeUpdate(sql);
		System.out.println(res + " row inserted.");
		
		sql = "insert into participate values('" + group_id + "', '" + user_id + "')";
		System.out.println(sql);
		
		res = stmt.executeUpdate(sql);
		System.out.println(res + " row inserted.");
		
		
		// conn.commit();			
	}catch(SQLException ex2) {
		System.err.println("sql error = " + ex2.getMessage());
		System.exit(1);
	}
	%>
	<script type="text/javascript">
		var changeUrl = '/Phase4/groups.jsp'; // �⺻ URL�� ����Ʈ ���� �� �����ϰ� ���� URL
		var urlString = location.href;
		alert('�׷��� �߰��Ǿ����ϴ�.');
		window.location.replace(changeUrl);
	</script>
</body>
</html>