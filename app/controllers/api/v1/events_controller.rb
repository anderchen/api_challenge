class Api::V1::EventsController < Api::V1::BaseController
  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.actor = Actor.first
    @event.repo = Repo.first
    if @event.save
      render :index, status: :created
    else
      render_error
    end
  end

  def erase
    Event.destroy_all
    head '200'
  end

  private

  def event_params
    params.require(:event).permit(:type)
  end

  def render_error
    render json: { errors: @event.errors.full_messages },
      status: :unprocessable_entity
  end
end
