class CommentsController < ApplicationController
  before_action :find_asset

  def index
    @comment = @asset.comments.build
  end

  def create
    @comment = @asset.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to [current_library, @asset, :comments]
    else
      flash[:error] = "Comment could not be saved"
      render 'index'
    end
  end

  def update
  end

  def destroy
  end

  def unsubscribe
    if request.post?
      subscription = @asset.comment_subscriptions.find_by(asset: @asset, subscriber: current_user)

      if subscription
        subscription.destroy
      end

      flash[:notice] = "You are now unsubscribed to notifications"
      redirect_to [current_library, @asset, :comments]
    else

    end
  end

  def subscribe
    comment_subscription = CommentSubscription.new(asset_id: @asset.id, user_id: current_user.id)
    if comment_subscription.save
      flash[:notice] = "You are now subscribed to comment notifications"
      redirect_to [current_library, @asset, :comments]
    else

    end
  end

  private
    def find_asset
      @asset = current_library.assets.find(params[:asset_id])
    end

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
