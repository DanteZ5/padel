class DivisionsController < ApplicationController

  def index
    @divisions = Division.all
  end

  def create
    if Division.count == 0
      name = "Division 1"
    else
      last_name = Division.last.name
      splitted_name = last_name.split(' ')
      i = splitted_name[1].to_i
      name = "Division #{i+1}"
    end
    Division.create(name: name)
    redirect_to divisions_path
  end

  def destroy
    Division.last.destroy
    redirect_to divisions_path
  end

  def generator
    teams = Team.where(division_id: params[:division_id])
    i = 0
    unless teams.count < 2
      teams.each do |team1|
        teams.each do |team2|
          unless (team1 == team2)
            if i % 2 == 0
              match = Match.create
            else
              match = Match.last
            end
            MatchTeam.create(match_id: match.id, team_id: team2.id)
            i += 1
          end
        end
      end
    end
    redirect_to divisions_path
  end

end
