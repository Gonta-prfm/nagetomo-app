class RelationshipsController < ApplicationController
  before_acition :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = "ユーザーをフォローしました"
      redirect_to @user
    else
      flash[:alert] = "ユーザーのフォローに失敗しました"
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = "ユーザーのフォローを解除しました"
      redirect_to @user
    else
      flash[:alert] = "ユーザーのフォロー解除に失敗しました"
      redirect_to @user
    end

    private
    def set_user
      @user = User.find(params[:relationship][:follow_id])
    end
end
