class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    @users = User.scoped.paginate(:page => params[:page])
    @title = t("users.title.all")
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.scoped.paginate(:page => params[:page])
    @title = @user.name
  end

  def following
    @title = t("users.title.following")
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = t("users.title.followers")
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  def new
    @user  = User.new
    @title = t("users.title.sign_up")
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user, :flash => { :success => t("users.flash.create") }
    else
      @title = t("users.title.sign_up")
      render 'new'
    end
  end
  
  def edit
    @title = t("users.title.edit")
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => t("users.flash.update") }
    else
      @title = t("users.title.edit")
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :flash => { :success => t("users.flash.destroy") }
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end
