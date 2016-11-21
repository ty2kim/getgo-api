class AgenciesController < ApplicationController
  def index
    @agencies = Agency.all
    render json: @agencies
  end

  def show
    @agency = Agency.first
    render json: @agency
  end
end
