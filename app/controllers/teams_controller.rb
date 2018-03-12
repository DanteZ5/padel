class TeamsController < ApplicationController
  def create
    team = Team.new()
    team.save
    current_user.update(team_id: team.id)
    player2 = User.find(params[:id])
    player2.update(team_id: team.id)
    redirect_to players_index_path
  end

  def update
    current_user.update(team_id: nil)
    player = User.find(params[:id])
    player.update(team_id: nil)
    redirect_to players_index_path
  end

  # private

  # def team_params
  #   params.require(:team).permit(:name, :score, :played, :rank, :status)
  # end
end
