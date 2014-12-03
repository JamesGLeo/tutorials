class Artist < ActiveRecord::Base
  has_many :songs

  validates :name, :nationality, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 50 }
end
