class PlayersController < ApplicationController
  def index
    players = User.all
    players = players - User.team('validate')
    players = players - [current_user]
    @players = players.sort_by { |player| player.created_at }.reverse
  end
end
