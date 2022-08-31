class UsersController < ApplicationController

  def show
    render json: User.find(params[:id])
  end

  def show_sales_by_user
    render json: User.find(params[:user_id])&.sales
  end

  def show_buys_by_user
    render json: User.find(params[:user_id])&.buys
  end

end
