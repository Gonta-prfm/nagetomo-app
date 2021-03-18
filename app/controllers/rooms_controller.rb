class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order("created_at DESC")
  end

  
  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user).order(:id).last(100)
    @message = current_user.messages.build
  end
  
  def new
    @room = Room.new
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
      params.require(:room).permit(:name, user_ids: [])
    end

end
