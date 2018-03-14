class TeamsController < ApplicationController
  def asking
    team = Team.new()
    team.save
    current_user.update(team_id: team.id, receiver: false)
    player2 = User.find(params[:id])
    player2.update(team_id: team.id, receiver: true)
    redirect_to players_path
  end

  def refused
    current_user.update(team_id: nil, receiver: nil)
    player = User.find(params[:id])
    player.update(team_id: nil, receiver: nil)
    redirect_to players_path
  end

  def accept
    team = Team.find(current_user.team_id)
    team.update(accepted: true)
    redirect_to players_path
  end

  # private

  # def team_params
  #   params.require(:team).permit(:name, :score, :played, :rank, :status)
  # end
end
