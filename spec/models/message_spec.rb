require 'spec_helper'

describe Message do

	let (:message) { Message.new(content: "Hello world", author: "mitchwd", kind: "tweet", url: "http://www.example.com/", visible: true) }

	it "saves attributes" do
		message.save!
		expect(message).to be_valid
	end
end
