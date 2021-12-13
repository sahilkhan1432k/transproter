class Room < ApplicationRecord

################################ Relationships ########################
    has_many :messages , dependent: :destroy
    
end
