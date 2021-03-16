class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order("created_at DESC")
  end

  def new
    @room = Room.new
    @room.users << current_user
  end

  def create 
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else 
      render :new
    end
  end

    private

    def room_params
      params.require(:room).permit(:name).merge(user_ids: current_user.id)
    end

end
