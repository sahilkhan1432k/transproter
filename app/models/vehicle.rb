class Vehicle < ApplicationRecord
  ################################ Relationships ########################

	has_one_attached :avatar
	has_many :meterails
	belongs_to :first_driver , class_name: "User", foreign_key: "first_driver_id", optional: true
	belongs_to :second_driver, class_name: "User", foreign_key: "second_driver_id", optional: true

  ################################ Valadations ########################
	validates :avatar, presence: true
end
