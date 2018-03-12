class Team < ApplicationRecord
  belongs_to :division, required: false

end
