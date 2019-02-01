class Api::V1::EventsController < Api::V1::BaseController

  def index
    @events = Event.all
  end
end
