class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
        user = User.create(email: data["email"],
	    		   password: Devise.friendly_token[0,20]
	    		  )
    end
    user
  end

  def refresh_token
	  data = {
	    :client_id => ENV["GOOGLE_KEY"],
	    :client_secret => ENV["GOOGLE_SECRET"],
	    :refresh_token => refresh_token,
	    :grant_type => "refresh_token"
	  }
	  @response = ActiveSupport::JSON.decode(RestClient.post "https://accounts.google.com/o/oauth2/token", data)
	  if @response["access_token"].present?
	    access_token = @response["access_token"]
	  end
  end
end
