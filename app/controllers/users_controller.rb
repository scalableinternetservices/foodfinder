class UsersController < ApplicationController

  def new
    # Render the login view
  end

  def show
    @user = User.find_by(:id => params[:id])
    render "show"
    # Render the user info page view
  end

  def edit
    @user = User.find_by(:id => params[:id])
    render "edit"
    # Allow a user to change the data about their account
  end

  def update
    user = User.find_by(:id => params[:id])
    user.update(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/user/:id'
    end
  end

  def create

    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :food_type, :address, :phone_number, :hours, :delivery)
    end

end
