class Song < ActiveRecord::Base
  validates :title, :artist, presence: true, length: { in: 2..20 }
  belongs_to :user
  has_many :playlists
  has_many :adding_users, through: :playlists, source: :user
end
