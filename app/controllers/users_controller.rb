class UsersController < ApplicationController

  def my_stockfolio
    @tracked_stocks = current_user.stocks
  end

end
