<!DOCTYPE html>

<html xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title>Salesforce Lightning Design System View Filtered Tweets Module</title>
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
    vertical-align: text-bottom;
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
<script type="text/javascript" src="underscore.js"></script>
</head>
<body>
<% response.setIntHeader("Refresh", 30);%>
<!-- REQUIRED SLDS WRAPPER -->
 <div class="TDJ">
	 <!-- MASTHEAD -->
	    <div class="slds-grid">
			<div class="slds-col slds-size--3-of-6"><p class="slds-text-heading--label slds-m-bottom--medium">
	      		Salesforce Lightning Design System View Filtered Tweets Module</p></div>		      		
   			<div align="right" class="slds-col slds-size--1-of-6">
   					<form action="LogoutServlet" method="GET">
   						<button class="slds-button slds-button--neutral" type="submit">Logout</button>						
					</form>			
   			</div>		    
		</div>
	  <!-- / MASTHEAD -->
  	<br>
	<div class="slds-page-header" role="banner">
		<div class="slds-grid">
			<div class="slds-col slds-size--3-of-6">
				 <b><%=request.getSession().getAttribute("msg") %> </b>
			</div>	 	
	    	<div align="right" class="slds-col slds-size--3-of-6">
	    		<form action="AppTweetServlet" method="GET">
	    			<button class="slds-button slds-button--neutral" type="submit">Home</button>						
				</form>			
	    	</div>		    
		</div>
	</div>
<br><br>
	<table id="outer">
	  <thead>
		<tr>
				<th>Profile</th>
				<th> UserName </th>
				<th> ScreenName </th>
				<th align="center"> Tweet </th>
				<th> Retweeted </th>
				<th> Date </th>
		</tr>
	  </thead>
	  <tbody>
	  </tbody>
	</table>
	<script type="text/javascript">
	  function getTweetInfo(elem, indx, list) {
	  	var container = document.getElementById("outer");
	  	var tweet = "<tr><td><img src='"+elem.ProfilePic+"'</td>"+
					"<td>"+elem.UserName+"</td>"+
					"<td>"+elem.ScreenName+"</td>"+
					"<td>"+elem.Tweet+"</td>"+
					"<td>"+elem.Retweeted+"</td>"+
					"<td>"+elem.Created+"</td></tr>";
	  	container.innerHTML = container.innerHTML + tweet;
	  }
	  
	  window.addEventListener("load", function(e) {
	    var t = <%= request.getSession().getAttribute("filtered_tweet_list") %>; 
	    var tweets = eval(t);
		//alert(t);
		//alert(tweets)
		 /* use the each() function to iterate over every element */
		_.each(tweets, getTweetInfo);
	  });
	 </script>
</div>
</body>
</html>