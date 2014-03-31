class PracticesController < ApplicationController
  def index
    render json: Practice.all
  end

  def show
    practice = Practice.find(params[:id])
    render json: practice
  end

  def create
    practice = Practice.new(practice_params)

    if practice.save
      render json: practice, status: :created
    else
      render json: practice.errors, status: :unprocessable_entity
    end
  end

  def update
    practice = Practice.find(params[:id])

    if practice.update_attributes(practice_params)
      render json: practice
    else
      render json: practice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    practice = Practice.find(params[:id])
    practice.destroy
    head :no_content
  end

  private
  def practice_params
    params.require(:practice).permit(:name, :description)
  end
end
