class Api::V1::ActorsController < Api::V1::BaseController
  def index
    @actors = Actor.all
  end
end
