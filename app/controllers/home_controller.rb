class HomeController < ApplicationController
  expose(:rooms) { Room.ready }


  def index
  end

end
