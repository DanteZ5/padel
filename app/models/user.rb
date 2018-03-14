class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  validates_presence_of :first_name, :last_name
  validates :phone, format: { with: /\A\d{10}\z/ }

  def self.validation
    users = User.all.select do |user|
      Team.find(user.team_id).accepted == true unless user.team_id.nil?
    end
  end
end
