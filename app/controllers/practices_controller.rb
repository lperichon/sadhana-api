class PracticesController < ApplicationController
  include ActionController::Serialization

  def index
    practices = current_user.practices.all
    render json: practices, each_serializer: PracticeCollectionSerializer
  end

  def show
    practice = current_user.practices.find(params[:id])
    render json: practice
  end

  def create
    practice = current_user.practices.new(practice_params)

    if practice.save
      render json: practice, status: :created
    else
      render json: practice.errors, status: :unprocessable_entity
    end
  end

  def update
    practice = current_user.practices.find(params[:id])

    if practice.update_attributes(practice_params)
      render json: practice
    else
      render json: practice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    practice = current_user.practices.find(params[:id])
    practice.destroy
    head :no_content
  end

  private
  def practice_params
    params.require(:practice).permit(:name, :description)
  end
end
