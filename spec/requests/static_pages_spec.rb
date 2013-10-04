require "spec_helper"

describe "Static page" do
  describe "Home page" do
    before {visit root_path}
    it "should have the content 'Welcome to the Sample App'" do
      expect(page).to have_content("Welcome to the Sample App")
    end
    it "should have the title 'Ruby on Rails'" do
      expect(page).to have_title("Ruby on Rails")
    end
  end
end
