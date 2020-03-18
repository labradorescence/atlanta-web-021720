class Companion < ApplicationRecord
    has_many :doctor_companions
    has_many :doctors , through: :doctor_companions
end
