class Doctor < ApplicationRecord
    has_many :doctor_companions
    has_many :companions, through: :doctor_companions

    validates :name, presence: true
    validates :nickname, presence: true
end
