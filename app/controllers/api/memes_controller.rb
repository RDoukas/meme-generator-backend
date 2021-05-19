class Api::MemesController < ApplicationController
  def create
    @meme = Meme.new(
      user_id: current_user.id, 
      top_text: params[:top_text],
      bottom_text: params[:bottom_text],
      random_img: params[:random_img]
    )

    if @meme.save 
      render 'show.json.jb'
    else 
      render json: {message: "Failure!"}
    end
  
  end
 
 def index
  @memes = Meme.all
  render 'index.json.jb'
 end

 def show

 end

 def update

 end

 def delete
  
 end
end
