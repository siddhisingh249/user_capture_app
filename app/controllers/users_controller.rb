class UsersController < ApplicationController
  def index
    @users = User.all
    @total_users = @users.count
    @users = @users.where('name ILIKE ?', "%#{params[:query]}%") if params[:query].present?
    @users = @users.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end
end
