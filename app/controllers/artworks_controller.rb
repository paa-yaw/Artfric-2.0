class ArtworksController < ApplicationController
  before_action :find_artwork, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_artist!, except: [:index, :show]

  def index
    @artworks= Artwork.all.order("created_at DESC")
  end

  def show
    @comments= Comment.where(artwork_id: @artwork)
  end

  def new
    @artwork= current_artist.artworks.build
  end

  def create
    @artwork= current_artist.artworks.build(artwork_params)

    if @artwork.save
      redirect_to @artwork, notice: "Artwork successfully saved!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if current_artist!=@artwork.artist
      redirect_to @artwork, notice: "Can't update"
    elsif current_artist==@artwork.artist
    if @artwork.update(artwork_params)
      redirect_to @artwork, notice: "Artwork successfully updated!"
    else
      render 'edit'
    end
    end
    
  end

  def destroy
    if current_artist!=@artwork.artist
      redirect_to @artwork , notice: "Can't Delete"
    else
      @artwork.destroy
      redirect_to  root_path
    end

  end

  def upvote
    if current_artist!=@artwork.artist
    @artwork.upvote_by current_artist
    redirect_to :back
    else
      redirect_to :back
    end

  end

  def downvote
    if current_artist!=@artwork.artist
    @artwork.downvote_by current_artist
    redirect_to :back
    else
      redirect_to :back
    end

  end

  private

  def find_artwork
    @artwork= Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :link, :content, :image, :remote_image_url)
  end
end
