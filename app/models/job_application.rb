class JobApplication < ApplicationRecord
################################ Relationships ########################

  belongs_to :user
  belongs_to :vehicle
  has_one_attached :cv
  has_rich_text :content

  include AASM
  aasm timestamps: true do
    state :new, initial: true
    state :interviewed
    state :shortlisted
    state :hired
    state :rejected

    event :interviewed do
      transitions from: :new, to: :interviewed
    end
    event :shortlisted do
      transitions from: :interviewed, to: :shortlisted
    end
    event :hired do
      transitions from: :shortlisted, to: :hired
    end
    event :rejected do
      transitions from: [:new, :interviewed, :shortlisted], to: :rejected
    end

  end


  ########################## VOlidation  ##########################
  validates :cv, attached: true, content_type: [:pdf]
end
