class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :property

  validates :answer, presence: true
end
