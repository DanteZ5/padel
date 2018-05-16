class Division < ApplicationRecord
   before_destroy :clean_users

  def clean_users
    teams = Team.where(division_id: self.id)
    teams.update(division_id: nil)
  end

  def find_matches
    teams = Team.where(division_id: self.id)
    # matches = Match.where(team_1_id: my_team_id)
    matches = Match.where(team_1_id: teams.ids)
    # match_ids = match_teams.map { |mt| mt.match_id }
    # return Match.where(id: match_ids)
  end

end
