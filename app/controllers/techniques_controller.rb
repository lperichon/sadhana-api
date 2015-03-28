class TechniquesController < ApplicationController
  include ActionController::Serialization

  def index
    techniques = Technique.all
    render json: techniques
  end

end
