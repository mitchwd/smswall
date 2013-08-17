require 'spec_helper'

describe Message do

    let(:message) { Message.new }

    it { expect(message).to validate_presence_of :content }
    it { expect(message).to validate_presence_of :author }
    it { expect(message).to validate_presence_of :kind }
    it { expect(message).to validate_presence_of :message_timestamp }
    it { expect(message).to ensure_length_of(:content).is_at_most(255) }
    it { expect(message).to ensure_inclusion_of(:kind).in_array(['tweet', 'sms', 'test']) }
   
    it "validates format of timestamp" do
        pending "WIP: Do we really need to test this?"
    end

    context "Tweets" do
        let (:message) { Message.new(content: "Hello world", author: "mitchwd", kind: "tweet", url: "http://www.example.com/", visible: true, message_timestamp: "Thu Nov 26 00:00:00 -0800 2009") }

        describe "attributes" do

            it "ensures tweet has url" do
               expect(message).to validate_presence_of :url
            end

            it "saves attributes" do
                message.save!
                expect(message).to be_valid
            end

        end
    end

    context "SMS" do
        let (:message) { Message.new(content: "Hello world", author: "61401234567", kind: "sms", url: "", visible: true, message_timestamp: "Thu Nov 26 00:00:00 -0800 2009") }

        describe "attributes" do
            it "ensures SMS does not have url" do
                expect(message.url).to eq("")
            end

            it "ensures author is a phone number" do
              expect(message).to validate_numericality_of :author
            end

            it "saves attributes" do
                message.save!
                expect(message).to be_valid
            end
        end

    end
  
end