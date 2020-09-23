class StocksController < ApplicationController
  def  search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/results'}
        end
      else
        flash[:alert]  = "Please enter a valid symbol to search"
        redirect_to my_stockfolio_path
      end

    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_stockfolio_path
    end
  end
end
