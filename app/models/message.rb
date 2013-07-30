class Message < ActiveRecord::Base

	validates :content, :author, :kind, presence: true
	validates :message_timestamp, presence: true
	validates :kind, inclusion: { in: %w(tweet sms) }
	validates :content, length: { maximum: 255 }

	# Validate that only tweets have a corresponding URL
	validates :url, presence: true, if: :should_have_url?

	# Validate that sms' authors are phone numbers
	validates :author, numericality: true, if: :should_have_phone_number?

	def should_have_url?
		kind == "tweet"
	end

	def should_have_phone_number?
		kind == "sms"
	end

end
