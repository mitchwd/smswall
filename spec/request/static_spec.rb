require 'spec_helper'

describe "Static" do
  describe "GET /" do

    it "Render success" do
      visit '/'
      expect(page.status_code).to be(200)
    end

  end

  describe "GET /about" do

    it "Render success" do
      visit '/static/about'
      expect(page.status_code).to be(200)
    end
  end
end