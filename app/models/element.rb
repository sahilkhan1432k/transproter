class Element < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  has_one_attached :avatar
end
