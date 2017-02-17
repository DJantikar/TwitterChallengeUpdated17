package com.twitter;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class FilterTweet
 */
@WebServlet("/FilterTweetServlet")
public class FilterTweetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Fetch the search key
		String inputFilter = request.getParameter("inputFilter");
		JSONArray filteredTweets  = new JSONArray();
		//Check for null or empty string
		if(inputFilter!=null && !inputFilter.isEmpty()){
			JSONArray list  = (JSONArray) request.getSession().getAttribute("tweet_list");	
			int i=0;
			while(list!=null && i<list.length()){
				JSONObject obj = list.getJSONObject(i);
				if(obj.getString("Tweet").contains(inputFilter)){
					filteredTweets.put(obj);
				}
				i++;
			}
		}
		//Push to JSP view from this controller
		String msg = (filteredTweets!=null && filteredTweets.length()>0) ? ("Tweets with string '"+inputFilter+"'")
												 : ("Sorry ! No tweets with string '"+inputFilter+"'");
		request.getSession().setAttribute("msg", msg);
		request.getSession().setAttribute("filtered_tweet_list", filteredTweets);		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/LDS_view_filtered_tweets.jsp");	
		dispatcher.forward(request, response);		
	}

}
