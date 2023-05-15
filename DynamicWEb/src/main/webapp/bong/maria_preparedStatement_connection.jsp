
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
PreparedStatement pstmt = null;
ResultSet rs = null;
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mariadb://127.0.0.1:3306/WRM";

try {
	//driverManager 객체생성, 등록
	Class.forName(driver);
	
	//오라클 계정, 비밀번호 입력
	conn = DriverManager.getConnection(url, "APP", "APP");
	//prepareStatement는 sql문을 미리 만들어두고 변수를 따로 입력하는 방식으로 효율성이나 유지보수 측면에서 유리한 구조이며 
	//sql injection 공격까지 방어가 가능함 
	//기본적으로 Statement를 상속받기 댸문에 Statement클래스 메서드를 모두 사용이 가능함
	String sql = "SELECT * FROM bm_code WHERE GRP_CD = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("grp_cd"));
	
	rs = pstmt.executeQuery(); //select 문의 결과에 해당하는 데이터에 접근 할 수 있는 방법을 제공
	//executeUpdate() - update, delete와 같은 문을 수행할 때 사용( 주로수정), 반환값은 int값으로, 처리된 데이터의 수를 반환한다.
	
	while(rs.next()){
		%>
		<%=rs.getString("code_nm")%>
		<%
	}
	
	rs.close();
	pstmt.close();
	conn.close();
	
} catch(Exception e) {
	//connect = false;
	e.printStackTrace();
} finally {
	if(rs != null){
		rs.close();
	}
	if(pstmt != null) {
		pstmt.close();	
	}
	if(conn != null) {
		conn.close();	
	}
	
}
%>