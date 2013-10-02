class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash.now[:success] = "Welcme"
      redirect_to user
    else
      flash.now[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
