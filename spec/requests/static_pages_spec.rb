require "spec_helper"

describe "Static page" do
  describe "Home page" do
    before {visit '/static_pages/home'}
    it "should have the content 'StaticPages#home'" do
      expect(page).to have_content("StaticPages#home")
    end
    it "should have the title 'Ruby on Rails'" do
      expect(page).to have_title("Ruby on Rails")
    end
  end
end
