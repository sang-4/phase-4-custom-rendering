class Cheese < ApplicationRecord
  
  def summary
      "#{name}: $#{price}"
  end

  def show
      cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: { error: 'Cheese not found' }, status: :not_found
  end
    
  end

end
