class Api::MemesController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]

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
  @meme = Meme.find_by(id: params[:id])
  render "show.json.jb"

 end

 def update
  @meme = Meme.find_by(id: params[:id])

  @meme.top_text = params[:top_text] || @meme.top_text
  @meme.bottom_text = params[:bottom_text] || @meme.bottom_text
  @meme.random_img = params[:random_img] || @meme.random_img

  if @meme.save 
    render "show.json.jb"
  else 
    render json: {message: "you suck"}
  end



 end

 def delete

  @meme = Meme.find_by(id: params[:id])
  @meme.destroy 
  if @meme.destroy
    render json: {message: "you deleted your meme"}
  end
  


 end
end
