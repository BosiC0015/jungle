class SessionsController < ApplicationController

  # skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      sessions[:user_id] = @user.id
      redirect_to [:userpage]
    else
      redirect_to [:login]
    end
  end

  def destroy
  end

  def login
  end

  def userpage
  end

  def page_requires_login
  end
  
end
