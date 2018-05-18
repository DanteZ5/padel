class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  after_validation :full_name
  validates_presence_of :first_name, :last_name
  validates :phone, format: { with: /\A\d{10}\z/ }

  def full_name
    self.fullname = "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def self.validation
    users = User.all.select do |user|
      Team.find(user.team_id).accepted == true unless user.team_id.nil?
    end
  end

  def find_my_matches
    my_team_id = self.team_id
    return matches = Match.where(team_1_id: my_team_id) + Match.where(team_2_id: my_team_id)
    # team_id = self.team_id
    # match_teams = MatchTeam.where(team_id: team_id)
    # match_ids = match_teams.map { |mt| mt.match_id }
    # return Match.where(id: match_ids)
  end
end
