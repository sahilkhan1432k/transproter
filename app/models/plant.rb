class Plant < ApplicationRecord
  ################################ Relationships ########################
    has_one_attached :avatar
    has_many :materials

  ################################ Validations ########################
    validates :avatar, attached: true, content_type: [:png, :jpg, :jpeg]
    
end
