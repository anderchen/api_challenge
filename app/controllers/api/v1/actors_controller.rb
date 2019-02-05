class Api::V1::ActorsController < Api::V1::BaseController
  before_action :set_actor, only: [:show, :update]

  def index
    @actors = Actor.all
  end

  def update
    if @actor.update(actor_params)
      render :index
    else
      render_error
    end
  end

  def streak
    @actors = Actor.all.order('events_count DESC')
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:id, :login, :avatar_url)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
