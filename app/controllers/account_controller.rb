class AccountController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
    
  end
  
   def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(users_path, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
