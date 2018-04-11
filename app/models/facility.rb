class Facility < ApplicationRecord
  belongs_to :district

  has_many :patients, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :district, message: "should be unique per district" }

  validates :district, presence: true
end
