class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  
  def confirm
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      render template: 'rooms/show'
    else  
      staylength_totalprice
    end  
  end
  
  def create
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_show_path(@reservation.id)
    else
      render room_path(@room.id)
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    staylength_totalprice
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :number_of_guest, :room_id)
  end
  
  def staylength_totalprice
    @length_of_stay = (@reservation.finish_date - @reservation.start_date).to_i
    @total_price = @reservation.room.price * @reservation.number_of_guest * @length_of_stay
  end
end
