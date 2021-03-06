package com.twitter;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.RequestToken;
import twitter4j.conf.ConfigurationBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.io.IOException;


@WebServlet("/TwitterSignInServlet")
public class TwitterSignInServlet extends HttpServlet {
    private static final long serialVersionUID = -6205814293093350242L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Form the callback url
			StringBuffer callbackURL = request.getRequestURL();
			int index = callbackURL.lastIndexOf("/");
			callbackURL.replace(index, callbackURL.length(), "").append("/TwitterCallbackServlet");
			
			ConfigurationBuilder cb = new ConfigurationBuilder();
			cb.setDebugEnabled(true).setOAuthConsumerKey(TokensAuth.consumerKey)
			            .setOAuthConsumerSecret(TokensAuth.consumerSecret)
			            .setOAuthAccessToken(null)
			            .setOAuthAccessTokenSecret(null);
			 //Get twitter instance without access token    
			 TwitterFactory tf = new TwitterFactory(cb.build());
			 Twitter twitter = tf.getInstance();

			 request.getSession().setAttribute("twitter", twitter);

			 RequestToken requestToken = twitter.getOAuthRequestToken(callbackURL.toString());
			
			 request.getSession().setAttribute("requestToken", requestToken);
			 
			 request.getSession().setAttribute("account", request.getParameter("account"));
			 //Sign into twitter
			 response.sendRedirect(requestToken.getAuthenticationURL());
		
		} catch (TwitterException e) {
		    throw new ServletException(e);
		}

    }
}
