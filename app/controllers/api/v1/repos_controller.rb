class Api::V1::ReposController < Api::V1::BaseController

  def create
  @repo = Repo.new(repo_params)
    if @repo.save
      render :index, status: :created
    else
      render_error
    end
  end



  private

  def repo_params
    params.require(:repo).permit(:id, :name, :url)
  end
end
