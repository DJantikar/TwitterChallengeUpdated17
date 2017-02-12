package com.twitter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tweet {
	
	private String userName;
	private String screenName;
	private String profileImage;
	private String tweetContent;
	private int retweetCount;
	private String tweetDate;
	public Tweet(String userName, String screenName, String profileImage, String tweetContent, int retweetCount,
			Date tweetDate) {
		super();
		this.userName = userName;
		this.screenName = screenName;
		this.profileImage = profileImage;
		this.tweetContent = tweetContent;
		this.retweetCount = retweetCount;
		this.tweetDate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(tweetDate);
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getScreenName() {
		return screenName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getTweetContent() {
		return tweetContent;
	}
	public void setTweetContent(String tweetContent) {
		this.tweetContent = tweetContent;
	}
	public int getRetweetCount() {
		return retweetCount;
	}
	public void setRetweetCount(int retweetCount) {
		this.retweetCount = retweetCount;
	}
	public String getTweetDate() {
		return tweetDate;
	}
	public void setTweetDate(String tweetDate) {
		this.tweetDate = tweetDate;
	}
	

}
