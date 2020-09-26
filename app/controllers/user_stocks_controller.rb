class UserStocksController < ApplicationController
  def create

    stock = Stock.check_db(params[:ticker])

    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end

    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was successfully added to your Stockfolio!"
    redirect_to my_stockfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id)
    user_stock.destroy_all
    flash[:notice] = "#{stock.ticker} was successfully removed from your Stockfolio!"
    redirect_to my_stockfolio_path
  end
end
