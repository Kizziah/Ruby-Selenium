require 'spec_helper'

describe Army do

  it "should delete squad and remove it's points" do
    visit armies_path
    page.should have_content "Army"
    click_link "New Army"
    page.should have_content "New army"
    fill_in "Name", with: "Cool Name"
    select "Cultist", from: "Squad 1"
    select "Havoc", from: "Squad 2"
    select "Havoc", from: "Squad 3"
    click_button "Create Army"
    page.should have_content "Cool Name"
    page.should have_content "200"
    click_link "Edit"
    check "army[squads_attributes][1][_destroy]"
    click_button "Update Army"
    page.should have_content "125"
  end

end
