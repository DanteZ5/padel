class Team < ApplicationRecord
  belongs_to :division, required: false
  before_destroy :clean_users
  # has_many :matches, dependent: :destroy
  # accessor necessaire au simple form new team
  attr_accessor :player_1
  attr_accessor :player_2

  def clean_users
    players = User.where(team_id: self.id)
    players.update(team_id: nil)
  end


end
