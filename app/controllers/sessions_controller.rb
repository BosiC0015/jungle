class SessionsController < ApplicationController

  # skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to [:userpage]
    else
      redirect_to [:login]
    end
  end

  def destroy
    if current_user
      session[:user_id] = nil
      redirect_to [:root]
    else
      redirect_to [:root]
    end
  end

  def login
  end

  def userpage
  end

  def page_requires_login
  end
  
end
