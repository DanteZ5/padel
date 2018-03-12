class PlayersController < ApplicationController
  def index
    @players = User.all.order(:updated_at).reverse
  end
end
