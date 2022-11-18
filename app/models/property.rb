class Property < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :applications, dependent: :destroy

  

end
