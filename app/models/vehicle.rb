class Vehicle < ApplicationRecord
  ################################ Relationships ########################

	has_one_attached :avatar , dependent: :destroy
	has_many :materails , dependent: :destroy
	belongs_to :user
	has_many :job_applications , dependent: :destroy

	has_one :first_driver , class_name: "User", foreign_key: :first_driver_id
	has_one :second_driver, class_name: "User", foreign_key: :second_driver_id

  ################################ Valadations ########################
	validates :name, presence: true
	validates :color, presence: true
	validates :modle, presence: true
	validates :vehicle_number, presence: true
	validates :avatar, attached: true, content_type: [:png, :jpg, :jpeg]

end
