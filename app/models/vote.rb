# app/models/vote.rb
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  validates :user_id, uniqueness: { scope: :candidate_id, message: "はすでに投票済みです" }
end
