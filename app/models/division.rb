class Division < ApplicationRecord
   before_destroy :clean_users

  def clean_users
    teams = Team.where(division_id: self.id)
    teams.update(division_id: nil)
  end



end
