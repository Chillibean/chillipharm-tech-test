class SearchesController < ApplicationController

  def create
    Search.create(search_params)
  end

  # Index doesn't work
  def index
    @searches = Search.all
  end

  private

  def search_params
    params.permit(:name, :assets_ids, :user_id)
  end
end
