<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="p1.Connector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>faculty login</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="faculty">
<h1>K MEANS</h1>
<H2>FINAL CLUSTER</H2>

<%
int c1=0,c2=0,c3=0,c4=0,d1,d2,d3,d4,d5,d6;
try{
	Connection con=Connector.getconnection();
	PreparedStatement stmt=con.prepareStatement("SELECT * FROM kmeans.500_person_gender_height_weight;");
	ResultSet rs=stmt.executeQuery();
	while(rs.next()){
		if(c1==0){
			c1=rs.getInt(2);
			
		}
		if(c2==0){
			c1=rs.getInt(3);
			
		}
		if(c3==0||c3==c1){
			c1=rs.getInt(2);
			
		}
		if(c4==0||c4==c2){
			c1=rs.getInt(3);
			
		}
		if(rs.getInt(5)>=3){
			d1=(int)Math.pow(rs.getInt(2)-c1,2);
			d2=(int)Math.pow(rs.getInt(3)-c2,2);
			d3=(int)Math.pow(rs.getInt(2)-c3,2);
			d4=(int)Math.pow(rs.getInt(3)-c4,2);
			d5=(int)Math.sqrt(d1+d2);
			d6=(int)Math.sqrt(d3+d4);
			if(d5>d6){
				c1=(rs.getInt(2)+c1)/2;
				c2=(rs.getInt(3)+c2)/2;
				
			}
			else if (d5<d6){
				c3=(rs.getInt(2)+c3)/2;
				c4=(rs.getInt(3)+c4)/2;
			}
			
		}
		
		
	}
	out.print("cluster 1<br>");
	out.print(c1+"<br>");
	out.print(c2+"<br>");
	out.print("cluster 2<br>");
	out.print(c3+"<br>");
	out.print(c4+"<br>");
	
}catch(Exception e){
	e.printStackTrace();
}


%>
</table>
</div>
</body>
</html>