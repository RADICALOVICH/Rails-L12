class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{current_user.name}"
      redirect_to root_path
    else
      flash[:warning] = 'Ошибка в вводе почты и/или пароля'
      redirect_to new_session_path
    end
  end

  def destroy

  end
end
