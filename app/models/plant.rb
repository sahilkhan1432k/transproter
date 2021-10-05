class Plant < ApplicationRecord
  ################################ Relationships ########################
    has_one_attached :avatar
    has_many :materials

  ################################ Validations ########################
    validates :avatar, presence: true
    
end
