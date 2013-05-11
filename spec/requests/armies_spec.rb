require 'spec_helper'

describe Army do
    it "Army Homepage should have basic features" do
      visit armies_path
      page.should have_content "Army"
      click_link "New Army"
      page.should have_content "New"
    end

    it "should allow a user to add squads" do
      visit armies_path

    end

end

