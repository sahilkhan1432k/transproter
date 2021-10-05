class Material < ApplicationRecord
  ################################ Relationships ########################
    has_one_attached :avatar
    has_many :vehicles
    belongs_to :plant

  ################################ Valadations ########################
    validates :avatar, presence: true
end
