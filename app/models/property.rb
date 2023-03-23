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

  validate :check_valid_image

  private 

  def check_valid_image

    if image_url&.present?

      type = FastImage.type(image_url)
      
      unless [:png, :jpg, :jpeg].include?(type)
        self.errors.add(:image_url, "Must be a valid image file")
      end
    end

  end

end
