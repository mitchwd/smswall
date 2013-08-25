class Message < ActiveRecord::Base

	validates :content, :author, :kind, presence: true
	validates :message_timestamp, presence: true
	validates :kind, inclusion: { in: %w(tweet sms test announcement) }
	validates :content, length: { maximum: 255 }

	# Validate that only tweets have a corresponding and valid URL
	validates :url, presence: true, format: { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }, if: :should_have_url?

	# Validate that sms' authors are phone numbers
	validates :author, numericality: true, if: :should_have_phone_number?

	def should_have_url?
		kind == "tweet"
	end

	def should_have_phone_number?
		kind == "sms"
	end

end
