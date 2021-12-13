class Message < ApplicationRecord
################################ Relationships ########################

	belongs_to :user
	belongs_to :room

################################ Volidation ########################

	validates :content, presence: true
	after_create_commit { MessageBroadcastJob.perform_later (self) }

end
