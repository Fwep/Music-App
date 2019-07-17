# == Schema Information
#
# Table name: tracks
#
#  id       :bigint           not null, primary key
#  album_id :bigint           not null
#  title    :string           not null
#  ord      :integer          not null
#  lyrics   :text
#  bonus    :boolean          default(FALSE)
#

class Track < ApplicationRecord
  validates :album_id, :ord, :title, presence: true
  validates :bonus, inclusion: {in: [true, false]}
  validates :ord, uniqueness: {scope: :album_id, message: "Two tracks in the same album cannot have the same ord"}

  belongs_to :album

  has_one :band
    through: :album,
    source: :band
  
  after_initialize :set_defaults

  def set_defaults
    self.bonus ||= false
  end
end
