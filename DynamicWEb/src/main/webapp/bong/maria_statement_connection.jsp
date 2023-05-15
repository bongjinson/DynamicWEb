<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

<%
/* 
driver=org.mariadb.jdbc.Driver
url=jdbc:mariadb://127.0.0.1:3306/WRM
username=APP
password=APP
*/
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mariadb://127.0.0.1:3306/WRM";
//Boolean connect = false;

try {
	//driverManager 객체생성, 등록
	Class.forName(driver);
	
	//오라클 계정, 비밀번호 입력
	conn = DriverManager.getConnection(url, "APP", "APP");
	stmt = conn.createStatement();
	
	String sql = "select now() as now";
	rs = stmt.executeQuery(sql); //select 문의 결과에 해당하는 데이터에 접근 할 수 있는 방법을 제공
	//executeUpdate() - update, delete와 같은 문을 수행할 때 사용( 주로수정), 반환값은 int값으로, 처리된 데이터의 수를 반환한다.
	
	while(rs.next()){
		%>
		<%= rs.getString("now") %>
		<%
	}
	
	rs.close();
	stmt.close();
	conn.close();
	
} catch(Exception e) {
	//connect = false;
	e.printStackTrace();
} finally {
	if(rs != null){
		rs.close();
	}
	if(stmt != null) {
		stmt.close();	
	}
	if(conn != null) {
		conn.close();	
	}
}
%>
