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

  describe "GET /setup" do
    it "Render success" do
      visit '/static/setup'
      expect(page.status_code).to be(200)
    end

    it "shows a link to a provider" do
      visit '/static/setup'
      expect(page).to have_content("www.nexmo.com")
    end

    it "shows the callback url" do
      pending "Create controller first."
    end
  end
end