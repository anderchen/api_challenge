class Api::V1::EventsController < Api::V1::BaseController
  def index
    @events = Event.all
  end

  def erase
    Event.destroy_all
    head '200'
  end
end
