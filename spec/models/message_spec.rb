require 'spec_helper'

describe Message do

    let(:message) { FactoryGirl.build(:message) }

    it { expect(message).to validate_presence_of :content }
    it { expect(message).to validate_presence_of :author }
    it { expect(message).to validate_presence_of :kind }
    it { expect(message).to validate_presence_of :message_timestamp }
    it { expect(message).to ensure_length_of(:content).is_at_most(255) }
    it { expect(message).to ensure_inclusion_of(:kind).in_array(['tweet', 'sms', 'test', 'announcement']) }

    it "validates format of timestamp" do
        pending "WIP: Do we really need to test this?"
    end

    context "Tweets" do
        let (:message) { FactoryGirl.build(:tweet) }

        describe "attributes" do

            it "ensures tweet has url" do
               expect(message).to validate_presence_of :url
            end

            it "validates format of URL" do
                expect(message).to allow_value("http://www.example.com/test").for(:url)
                expect(message).to allow_value("https://www.example.com/test").for(:url)
                expect(message).to_not allow_value("www.example.com").for(:url)
                expect(message).to_not allow_value("test").for(:url)
                expect(message).to_not allow_value("http://").for(:url)
                expect(message).to_not allow_value("http:/").for(:url)
            end

            it "saves attributes" do
                message.save!
                expect(message).to be_valid
            end

        end
    end

    context "SMS" do
        let (:message) { FactoryGirl.build(:sms) }

        describe "attributes" do
            it "ensures SMS does not have url" do
                expect(message.url).to eq(nil)
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

    context "Invalid Message" do 
        let (:message) { FactoryGirl.build(:invalid_message) }

        describe "attributes" do
          it "should not save attributes" do
            expect(message).to be_invalid
          end
        end
    end
  
end