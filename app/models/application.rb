class Application < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :age, presence: :true, numericality: { greater_or_equal_to: 18 }
  validates :occupants, presence: :true, numericality: {less_than: 10}
  validates :sin, presence: :true, length: {minimum:9, maximum:10}
  validates :phone_number, presence: :true

end
