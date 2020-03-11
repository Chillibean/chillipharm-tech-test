class AssetsController < ApplicationController
  def show
    @asset = current_library.assets.find(params[:id])
  end

  def update
    @asset = current_library.assets.find(params[:id])

    if @asset.update_attributes(asset_params)
      flash[:notice] = "Asset Updated"
    else
      flash[:error] = "Could not update asset for the following reasons: #{@asset.errors.full_messages.to_sentence}"
    end

    redirect_to library_asset_path(current_library, @asset)
  end

  private
    def asset_params
      params.require(:asset).permit(:filename, :title)
    end
end
