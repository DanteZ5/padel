class MatchesController < ApplicationController
  def index
    @division = Division.find(params[:id])
    @matches = @division.find_matches
  end

  def report
    @team_id = current_user.team_id
    @matches = current_user.find_my_matches
    @match = Match.new
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(matches_params)
      redirect_to matches_report_path
    end
  end

  private

  def matches_params
    params[:match][:winning_team] = Team.find_by_name(params[:match][:winning_team]).id
    params.require(:match).permit(:date, :score, :winning_team, :team_1_id, :team_2_id)
  end

end
