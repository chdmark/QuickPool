class UserController < ApplicationController

  def index #/user
    @users = User.all
  end

  def new

  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)

    else
      flash[:error] = "Signup was unsuccessful. Please try again."
      redirect_to new_user_path
    end
  end

  def show
    if current_user
      @user = User.find(current_user.id)
      @trips = current_user.ridden_trips + current_user.driven_trips
      @requests = current_user.requests.where(match: false)
   
    else
      redirect_to root_path
    end
  end

  def edit
    if current_user
      @user = User.find(current_user.id)
    else
      flash[:error] = "You cannoth edit a different user's account!"
      redirect_to root_path
    end

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Update was not successful. Please try again."
      redirect_to edit_user_path(@user.id)
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :phone_number
      )

  end
end
