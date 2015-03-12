class Album < ActiveRecord::Base
  PERFORMANCE = %w(live studio)

  validates :performance, :band_id, :title, presence: true
  validates :performance, inclusion: { in: PERFORMANCE }

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
