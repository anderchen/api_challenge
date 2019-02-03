class Api::V1::ActorsController < Api::V1::BaseController
  before_action :set_actor, only: [:show]

  def index
    @actors = Actor.all
  end

  def create
  @actor = Actor.new(actor_params)
    if @actor.save
      render :index, status: :created
    else
      render_error
    end
  end

  def show
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:id, :login, :avatar_url)
  end


end
