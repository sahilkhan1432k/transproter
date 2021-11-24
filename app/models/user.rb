class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  ################################ Relationships ########################

  has_one_attached :avatar , dependent: :destroy
  has_many :job_applications , dependent: :destroy
  has_many :vehicles , dependent: :destroy
  belongs_to :first_vehicle, class_name:"Vehicle", foreign_key: :first_driver_id, optional: true
  belongs_to :second_vehicle, class_name:"Vehicle", foreign_key: :second_driver_id, optional: true
  
  has_one :second_driver, class_name: "User", foreign_key: "user_driver_id"
  belongs_to :first_driver, class_name: "User", optional: true

  has_many :messages , dependent: :destroy

    


  ########################## VOlidation  ##########################
  validates :avatar, attached: true, content_type: [:png, :jpg, :jpeg]



  ################################ Constants ############################


  USER_TYPE_FIRST_DRIVER = "first_driver"
  USER_TYPE_SECOND_DRIVER = "second_driver"
  USER_TYPES = [
    USER_TYPE_FIRST_DRIVER ,
    USER_TYPE_SECOND_DRIVER
  ]
end
