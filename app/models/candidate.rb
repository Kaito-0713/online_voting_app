# app/models/election.rb
# app/models/candidate.rb
class Candidate < ApplicationRecord
  belongs_to :election
  has_many :votes, dependent: :destroy

  has_one_attached :image
  
  validates :name, presence: true
  validates :party, presence: true


  def generate_public_image
    return unless image.attached?

    tmp_path = Rails.root.join("tmp", "candidate_#{id}.jpg")
    File.open(tmp_path, "wb") { |f| f.write(image.download) }

    FileUtils.mkdir_p(Rails.root.join("pubric", "image", "candidates"))
    resized_path = Rails.root.join("public", "images", "candidates", "candidate_#{id}_resized.jpg")
    
    img = MiniMagick::Image.open(tmp_path)
    img.resize "300x300"
    img.write(resized_path)
  end
end