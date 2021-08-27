class RoomsController < ApplicationController
  def index
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :price, :adress, :room_image, :user_id))
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to @room
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def posts
    @rooms = @current_user.rooms
  end

end
