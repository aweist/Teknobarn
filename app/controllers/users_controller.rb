class UsersController < ApplicationController

  def index
    @users = User.all.order(:last_name)
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to @user
  end

  def create
    flash[:notice] = 'Sucessfully created users'
    csv = params[:csv]
    csv.lines.each do |line|
      user_hash = line.split("\t")
      User.create(first_name: user_hash[0], last_name: user_hash[1], email: user_hash[2].strip)
    end
    redirect_to controller:'users', action:'index'
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def rsvp
    @user = User.find_or_create_by(email: params[:email])
    @user.update(clicked_invite: (@user.clicked_invite + 1))
    session[:current_user] = @user
    logger.debug "Current session user: #{session[:current_user]}"
  end

  def confirm
    @user = User.find(params[:id])
    if request.post?
      @user.update(size: params[:shirt_size])
      @user.update(rsvp: 'y')
      redirect_to controller:'users', action:'success'
    end
  end

  def decline
    @user = User.find(params[:id])
    @user.update(rsvp: 'n')
  end

  def success
    @user = User.find(params[:id])
  end

  def rsvp_save
    session[:user] = User.find_by_id(params[:id])
    params[:response]
    logger.debug "Person attributes hash: #{params[:response]}"
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

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :rsvp)
    end

end
