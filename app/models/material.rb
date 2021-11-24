class Material < ApplicationRecord
  ################################ Relationships ########################
    has_one_attached :avatar, dependent: :destroy
    has_many :vehicles , dependent: :destroy
    belongs_to :plant

  ################################ Valadations ########################
    validates :avatar, attached: true, content_type: [:png, :jpg, :jpeg]
end
