class Api::V1::ActorsController < Api::V1::BaseController
  before_action :set_actor, only: [:show]

  def index
    @actors = Actor.all
  end

  def show
    # @actor_events = @actor.events
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end
end
