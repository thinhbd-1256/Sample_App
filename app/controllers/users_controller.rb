class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create, :show]
  before_action :find_user, except: [:index, :new, :create]
  before_action :admin_user, only: :destroy

  def index
    @user_info = User.select :id, :name, :email
    @users = @user_info.paginate(page: params[:page]).order "name ASC"
  end

  def new
    @user = User.new
  end

  def show
    @microposts = @user.microposts.paginate page: params[:page]
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_activation_email
      flash[:info] = t :check_email
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t :updated
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy ? flash[:success] = t(:deleted) : flash[:danger] =  t(:deleted_fail)
    redirect_to users_url
  end

  def following
    @title = t :tit_following
    @user = User.find params[:id]
    redirect_to root_path if !@user
    @users = @user.following.paginate page: params[:page]
    render :show_follow
  end

  def followers
    @title = t :tit_follower
    @user = User.find params[:id]
    redirect_to root_path if !@user
    @users = @user.followers.paginate page: params[:page]
    render :show_follow
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t :plslogin
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_user
    @user = User.find_by_id params[:id]
    return if @user
    flash[:danger] = t :danger
    redirect_to new_user_path
  end
end
