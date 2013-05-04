require "omniauth-google-oauth2"
config.omniauth :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], {
	:scope => "https://www.googleapis.com/auth/glass.timeline,https://www.googleapis.com/auth/userinfo.profile",
	:approval_prompt => "auto",
	:access_type => "offline"
}