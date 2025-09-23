class User < ApplicationRecord
  # Devise 認証機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :votes, dependent: :destroy
  has_many :candidates, through: :votes
  has_one_attached :id_document

  # バリデーション
  validates :name, presence: true
  validates :verification_id, presence: true, uniqueness: true
  validates :id_document, attached: true,
                          content_type: ['image/png', 'image/jpg', 'image/jpeg']

  # 投票済みチェック
  def voted_for?(election)
    votes.joins(:candidate).where(candidates: { election_id: election.id }).exists?
  end

  # 管理者か判定
  def admin?
    self.admin
  end
end

