class UsersController < ApplicationController
  
  def index
  end
  
  def signup
    @user = User.new
  end
  
  def create
     @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation).merge(introduction: ""))
    if @user.save(context: :create)
      @user.image_name.attach(io: File.open(Rails.root.join('storage', 'default_icon.jpg')), filename: "default_icon.jpg")
      session[:user_id] = @user.id
      redirect_to ("/")
    else
      render "signup"
    end
  end 
  
  def show
  end 
  
  def profile_edit
    @user = User.find_by(id: @current_user.id)
  end 
  
  def profile_update
    @user = User.find_by(id: @current_user.id)
    if @user.update(params.require(:user).permit(:image_name, :name, :introduction))
      flash[:notice] = "プロフィールを更新しました"
      redirect_to :users_profile
    else
      render "profile_edit"
    end 
  end 
  
  def edit
    @user = User.find_by(id: @current_user.id)
  end 
  
  def update
    @user = User.find_by(id: @current_user.id)
    if @user.authenticate(params[:current_password])
      @user.update(params.permit(:email, :password, :password_confirmation))
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to :users_account
    else
      @error_message = "現在のパスワードが違います"
      render "edit"
    end
  end
  
  def destroy
  end 
  
  def account
  end 
  
  def signin_form
  end
  
  def signin
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to ("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render "signin_form"
    end
  end
  
  def signout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to ("/")
  end
end
