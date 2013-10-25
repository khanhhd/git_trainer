class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:update, :edit]
  before_action :admin_user, only: :destroy
  before_action :signed_in_user,
                  except: [:show, :create, :new]
  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to user_path(@user), notice: "welcome."
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      flash.now[:success] = "Updated profile"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "Success destroyed"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 2)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 2)
    render 'show_follow'
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                 :password_confirmation, :address)
  end

  def singed_in_user
    redirect_to signin_path, notice: "have not sign in" unless signed_in?
  end

  def correct_user
    @user= User.find(params[:id])
    redirect_to root_url, notice: "Not correct user" unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url, notice: "Must be admin" unless current_user.admin?
  end
end
