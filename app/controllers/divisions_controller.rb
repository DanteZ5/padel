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

  def destructor
    teams = Team.where(division_id: params[:division_id])
    matches = Match.where(team_1_id: teams.ids)
    matches.destroy_all
    redirect_to divisions_path
  end

  def generator
    teams = Team.where(division_id: params[:division_id])
    unless teams.count < 2
      teams.each do |team1|
        teams.each do |team2|
          # ci dessous, évite de créer un match avec 2 fois la même équipe
          unless (team1 == team2)
            # ci dessous, évite de créer un match retour (évite : éq1 VS éq2 puis éq2 VS éq1)
            if Match.find_by_team_1_id_and_team_2_id(team2.id, team1.id).nil?
              # ci dessous, génère le match une fois les conditions éxécutées
              match = Match.create(team_1_id: team1.id, team_2_id: team2.id)
            end
          end
        end
      end
    end
    redirect_to divisions_path
  end

end
