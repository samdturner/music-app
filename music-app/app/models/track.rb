class Track < ActiveRecord::Base
  SPECIAL = %w(bonus, regular)

  belongs_to :album

  validates :album_id, :title, :special, presence: true
  validates :special, inclusion: { in: SPECIAL }
end
