package com.twitter;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/TwitterCallbackServlet")
public class TwitterCallbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1657390011452788111L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get twitter object from session
		Twitter twitter = (Twitter) request.getSession().getAttribute("twitter");
		
		//Get twitter request token object from session
		RequestToken requestToken = (RequestToken) request.getSession().getAttribute("requestToken");
		String verifier = request.getParameter("oauth_verifier");

		try {
			// Get twitter access token object by verifying request token 
		    AccessToken accessToken = twitter.getOAuthAccessToken(requestToken, verifier);
		    TokensAuth.setUserAuth(accessToken.getToken(), accessToken.getTokenSecret());
		    response.sendRedirect(request.getContextPath()+"/AppTweetServlet");

		} catch (TwitterException e) {
			System.out.println(e.getMessage());
		    throw new ServletException();
		} 
		
    }

}
