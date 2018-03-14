class PlayersController < ApplicationController
  def index
    players = User.all
    players = players - User.validation()
    players = players - [current_user]
    @players = players.sort_by { |player| player.created_at }.reverse
  end

  def show
    @player = current_user
  end
end
