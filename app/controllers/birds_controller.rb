class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # or we could do render json: birds, except: [:created_at, :updated_at]
    # or we could do render json: birds.to_json(except: [:created_at, :updated_at])
  end
  def show 
    bird = Bird.find_by(id: params[:id])
    if bird 
    render json: bird.slice(:id, :name, :species)
    else  
      render json: {message: 'Bird not found'}
    end
end