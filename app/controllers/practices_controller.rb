class PracticesController < ApplicationController
  def index
    render json: Practice.all
  end

  def show
    practice = Practice.find(params[:id])
    render json: practice
  end
end
