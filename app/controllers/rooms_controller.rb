class RoomsController < ApplicationController
  expose(:room, attributes: :room_params)


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

  private

  def room_params
    params.require(:room).permit(:name, :status, :count)
  end

end
