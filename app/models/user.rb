class User < ApplicationRecord
    has_secure_password

    before_save :capitalize_name

    has_many :properties, dependent: :destroy
    has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy
    has_many :applications, dependent: :destroy
    has_many :notifications, dependent: :destroy

    validates :first_name, presence: :true
    validates :last_name, presence: :true
    validates :password, presence: true
    

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

    def full_name
        self.first_name + " " + self.last_name
    end

    private

    def capitalize_name
        self.first_name.capitalize!
        self.last_name.capitalize!
    end

end
