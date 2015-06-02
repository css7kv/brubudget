class SessionsController < ApplicationController
  def new
  	@user = current_user
  end

  def create
  	auth_hash = request.env['omniauth.auth']

  	@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	if @authorization
	    render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
	else
	    user = User.new :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
	    user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
	    user.save
 
  		render :text => auth_hash.inspect
  	end
  end

  def failure
  render :text => "Sorry, but you didn't allow access to our app!"
end

  def destroy
  session[:user_id] = nil
  render :text => "You've logged out!"
	end

end
