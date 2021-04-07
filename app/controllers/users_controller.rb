class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @relationship = current_user.relationships.find_by(follow_id: @user.id)  
    @set_relationship = current_user.relationships.new
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.all
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all
  end

  def search
    if params[:search_keyword].present?
      @users = User.where('nickname LIKE ?', "%#{params[:search_keyword]}%")
    else 
      @users = User.none
    end
  end

end
