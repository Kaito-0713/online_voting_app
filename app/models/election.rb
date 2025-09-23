# app/models/election.rb
class Election < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :votes, dependent: :destroy

def voting_open?
  start_at.present? && end_at.present? && Time.current.between?(start_at, end_at)
end

end
