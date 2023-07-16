class HomeController < ApplicationController
  def index
    @q = Room.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

end
