class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  ################################ Relationships ########################

  has_one_attached :avatar
  has_one :vehicle
  
  has_one :second_driver, class_name: "User", foreign_key: "first_driver_id"
  belongs_to :first_driver, class_name: "User", optional: true

  belongs_to :first_vehicle, class_name: "Vehicle", foreign_key: "first_driver_id", optional: true
  belongs_to :second_vehicle, class_name: "Vehicle", foreign_key: "second_driver_id", optional: true
    


  ########################## VOlidation  ##########################
  validates :avatar, presence: true



  ################################ Constants ############################


  USER_TYPE_FIRST_DRIVER = "first_driver"
  USER_TYPE_SECOND_DRIVER = "second_driver"
  USER_TYPES = [
    USER_TYPE_FIRST_DRIVER ,
    USER_TYPE_SECOND_DRIVER
  ]
end
