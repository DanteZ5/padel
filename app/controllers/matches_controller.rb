class MatchesController < ApplicationController
  def index
    @division = Division.find(params[:id])
    @matches = @division.find_matches
  end

  def report
    @team_id = current_user.team_id
    @matches = current_user.find_my_matches
  end
end
