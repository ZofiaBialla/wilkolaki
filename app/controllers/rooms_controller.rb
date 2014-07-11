class RoomsController < ApplicationController
  expose(:room, attributes: :room_params)
  expose(:room_player) { player_for_room }


  def new
  end

  def create
    room.user_id = current_user.id
    room.status = 'ready'
    if room.save
      redirect_to(room)
    else
      render :new
    end
  end

  def show

  end

  def join
    if room.can_join?
      Player.create(room_id: room.id, user_id: current_user.id)
      redirect_to(room)
    else
      flash[:alert] = "This room: #{room.name} is full"
      redirect_to root_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :status, :count)
  end

  def player_for_room
    current_user.players.where(room_id: room.id).first
  end

end
