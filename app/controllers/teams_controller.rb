class TeamsController < ApplicationController
  def index
    @teams = Team.all
    @divisions = Division.all
  end

  def new
    @team = Team.new
    @players = User.where(team_id: nil)
  end

  def create
    p1 = User.find(params[:team][:player_1])
    p2 = User.find(params[:team][:player_2])
    name = "#{p1.last_name} / #{p2.last_name}"
    team = Team.create(name: name, accepted: true)
    p1.update(team_id: team.id)
    p2.update(team_id: team.id)
    redirect_to teams_path
  end


  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to teams_path
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to teams_path
  end

  def index_division
    @division = Division.find(params[:id])
    @teams = Team.where(division_id: @division.id)
  end




  # fonctions dédiées aux users

  def asking
    team = Team.new(name: current_user.last_name)
    team.save
    current_user.update(team_id: team.id, receiver: false)
    player2 = User.find(params[:id])
    player2.update(team_id: team.id, receiver: true)
    redirect_to players_path
  end

  def refused
    current_user.update(team_id: nil, receiver: nil)
    player = User.find(params[:id])
    team = Team.find(player.team_id)
    team.destroy
    player.update(team_id: nil, receiver: nil)
    redirect_to players_path
  end

  def accept
    team = Team.find(current_user.team_id)
    name = "#{team.name} / #{current_user.last_name}"
    team.update(name: name, accepted: true)
    redirect_to players_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :score, :played, :rank, :accepted, :division_id)
  end


end
