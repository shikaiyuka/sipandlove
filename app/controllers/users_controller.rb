class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @users = User.all.order(created_at: :desc)
  end


end

