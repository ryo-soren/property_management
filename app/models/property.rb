class Property < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :applications, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :amenities, presence: true

end
