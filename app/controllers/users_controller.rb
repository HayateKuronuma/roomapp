class UsersController < ApplicationController
  
  def index
  end
  
  def signup
    @user = User.new
  end
  
  def create
     @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation).merge(image_name: "default_icon.jpg", introduction: ""))
    if @user.save
      session[:user_id] = @user.id
      redirect_to ("/")
    else
      render "signup"
    end
  end 
  
  def show
  end 
  
  def edit
  end 
  
  def update
  end 
  
  def destroy
  end 
  
  def account
  end 
  
  def signin_form
  end
  
  def signin
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
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
