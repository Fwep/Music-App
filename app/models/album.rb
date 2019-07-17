# == Schema Information
#
# Table name: albums
#
#  id      :bigint           not null, primary key
#  band_id :bigint
#  title   :string           not null
#  year    :integer          not null
#  live    :boolean          default(FALSE), not null
#

class Album < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :year, presence: true, numericality: { minimum: 1900, maximum: 9000}
  validates :live, inclusion: {in: [true, false]}

  belongs_to :band

  has_many :tracks,
    dependent: :destroy

  after_initialize :set_defaults

  def set_defaults
    self.live ||= false
  end
end
