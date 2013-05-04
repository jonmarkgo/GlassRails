Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"],
           {
             :scope => "https://www.googleapis.com/auth/glass.timeline,https://www.googleapis.com/auth/userinfo.profile",
             :approval_prompt => "auto",
             :access_type => "offline
           }
end
