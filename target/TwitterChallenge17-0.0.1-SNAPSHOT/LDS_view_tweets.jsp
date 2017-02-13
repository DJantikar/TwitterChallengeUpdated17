<!DOCTYPE html>
<%@page import="java.util.ArrayList" %>
<%@page import="com.twitter.Tweet" %>
<html xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title>Salesforce Lightning Design System View Tweets Module</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="styles/salesforce-lightning-design-system-vf.min.css"  type="text/css">
    <style>
table {
    border-collapse: collapse;
    width: 100%;
}

td {
    text-align: left;
    padding: 20px;
    vertical-align: bottom;
}
tr:nth-child(even){background-color: AliceBlue}

th {
    background-color: #00b8e6;
    color: 	white ;
    padding: 20px;
    align: center;
}
table, td, th {    
    border: 1px solid #ddd;
}
</style>
</head>
<body>
<% response.setIntHeader("Refresh", 60);%>
<!-- REQUIRED SLDS WRAPPER -->
 <div class="TDJ">
			 <!-- MASTHEAD -->			    
			    <div class="slds-grid">
					<div class="slds-col slds-size--3-of-6"><p class="slds-text-heading--label slds-m-bottom--medium">
			      	Salesforce Lightning Design System View Tweets Module</p></div>	 			      		
	    			<div align="right" class="slds-col slds-size--1-of-6">
	    					<form action="LogoutServlet" method="GET">
	    						<button class="slds-button slds-button--neutral" type="submit">Logout</button>						
							</form>			
	    			</div>		    
				</div>
			 <!-- / MASTHEAD -->
			 
 			 <!-- PAGE HEADER -->

			<div class="slds-page-header" role="banner">
				<div class="slds-grid">
					<div class="slds-col slds-size--4-of-6"><b>Top ten tweets from <%= request.getSession().getAttribute("account") %> timeline </b></div>	 	
					    <div align="right" class="slds-col slds-size--2-of-6">
					    		<form action="FilterTweetServlet" method="GET">
					    			<div class="slds-grid">
					    				<div class="slds-col slds-size--3-of-4">
					    					<input display="" type="text" class="slds-input" name="inputFilter" placeholder="Type search key .."/></div>
					    				<div align="right" class="slds-col slds-size--1-of-4">
					    					<button  class="slds-button slds-button--neutral"  type="submit">Filter</button></div>
					    			</div>						
								</form>			
					    </div>		    
				</div>
			</div>
<div>
	<br><br>
	<table>
	  <tbody>
		<tr align="center">
				<th>Profile</th>
				<th> UserName </th>
				<th> ScreenName </th>
				<th> Tweet </th>
				<th> Retweeted </th>
				<th> Date </th>
		</tr>
		<% ArrayList<Tweet> tl = (ArrayList<Tweet>)  request.getSession().getAttribute("tweet_list");
	       for (Tweet t : tl) {
		%>                    
			<tr>
				<td  align="center" ><img src=<%=t.getProfileImage()%>/></td>
				<td><%=t.getUserName() %></td>
				<td><%=t.getScreenName() %></td>
				<td><%=t.getTweetContent() %></td>
				<td><%=t.getRetweetCount() %></td>
				<td><%=t.getTweetDate() %></td>
			</tr>
		<%}%>
	  </tbody>
	</table>
</div>
<!-- FOOTER -->
<footer role="contentinfo" class="slds-p-around--large">
  <!-- LAYOUT GRID -->
  <div class="slds-grid slds-grid--align-spread">
  	<p></p>
    <p class="slds-col">&copy; Deepa </p>
  </div>
  <!-- / LAYOUT GRID -->
</footer>
<!-- / FOOTER -->
</div>
</body>
</html>