class Api::V1::EventsController < Api::V1::BaseController
  before_action :set_actor, only: [:filtered]

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.actor = find_actor
    @event.repo = find_repo

    if Event.exists?(@event.id)
      render_400
    elsif @event.save
      render :index, status: :created
    else
      render_error
    end
  end

  def erase
    Event.destroy_all
    head '200'
  end

  def filtered
    @actor_events = @actor.events
  end

  private

  def event_params
    params.require(:event).permit(:id, :type, :created_at)
  end

  def actor_params
    params.require(:event).permit(actor_attibutes: [:id, :login, :avatar_url])
  end

  def repo_params
    params.require(:event).permit(repo_attibutes: [:id, :name, :url])
  end

  def find_actor
    Actor.find_or_create_by(actor_params)
  end

  def find_repo
    Repo.find_or_create_by(repo_params)
  end

  def render_error
    render json: { errors: @event.errors.full_messages },
           status: :unprocessable_entity
  end

  def render_400
    render json: { error: 'Event already in db', status: 400 }, status: 400
  end
end
