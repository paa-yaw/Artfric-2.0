class CommentsController < ApplicationController
  before_action :authenticate_artist!

  def create
    @artwork= Artwork.find(params[:artwork_id])
    @comment= @artwork.comments.create(comment_params)
    @comment.artist_id= current_artist.id
    @comment.artwork_id=@artwork.id

    if @comment.save
      redirect_to artwork_path(@artwork)
    else
      render 'new'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
