class UsersController < ApplicationController

def new
end

def create
	@user = User.new()
end

def show
  @users = User.all.order(:last_name)
end

def rsvp
  @user = User.find(params[:id])
  session[:current_user] = @user
  logger.debug "Current session user: #{session[:current_user]}"
end

def rsvp_save
  user_id = session[:current_user_id] = params[:email_address]
  params[:response]
  logger.debug "Person attributes hash: #{params[:response]}"
  user = User.find_by_id(session[:current_user_id])
  if params[:response] == 'attending'
    user.rsvp = true
  else
    user.rsvp = false
  end
  user.save!
  redirect_to controller:'welcome', action:'index'
end

def send_invites
  if request.get?
  else
    User.send_invites
  end
end

end
