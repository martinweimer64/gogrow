class SalesController < ApplicationController
  def index
    render json: Sale.all
  end

  def show
    render json: Sale.find(params[:id])
  end

end
