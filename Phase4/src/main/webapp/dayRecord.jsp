<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�츮���� 012</title>
<link rel="stylesheet" href="./common.css" />
<style>
	div {
		margin-top: 150px;
	}
	button {
		border: none;
		background-color: #5AC8C8;
		border-radius: 100%;
		width: 300px;
		height: 300px;
		padding: 10px;
		cursor: pointer;
		font-size: 1.7rem;
		margin: 20px;
	}
</style>
</head>
<body>
	<%
	String date = request.getParameter("date");
	String clickedDate = "202209" + date;
	if (Integer.parseInt(date) < 10) {
		clickedDate = "2022090" + date;
	}
	session.setAttribute("clickedDate", clickedDate);
	%>
	<div>
	<a href='addDiary.html'><button>������ �ϱ� �����ϱ�</button></a>
	<a href='answer.jsp'><button>������ ������ ���Ϸ� ����</button></a>
	<a href='voteRecent.jsp'><button>��ǥ ��ȸ/����</button></a>
	</div>
</body>
</html>