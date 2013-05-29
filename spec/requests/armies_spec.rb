require 'spec_helper'

describe Army do

  it "should create a Marine Army", :js => true  do
    visit armies_path
    page.should have_content "Army"
    click_link "New Army"
    page.should have_content "New army"
    page.should have_css("div.fields.squad")
    select "Marine", from: "army_squads_attributes_0_name"
    binding.pry
    select "car", from: "army_squads_attributes_0_troops_attributes_0_weapon"

    # page.should have_css('.squad table select', text: 'fuck')
    page.has_selector?('.squad table select[disabled]', count: 4)
    # 3.times { click_link "Add Troop" }

  end

end

    # fill_in "Name", with: "Cool Name"
    # select "Cultist", from: "Squad 1"
    # select "Havoc", from: "Squad 2"
    # select "Havoc", from: "Squad 3"
    # click_button "Create Army"
    # page.should have_content "Cool Name"
    # page.should have_content "200"
    # click_link "Edit"
    # check "army[squads_attributes][1][_destroy]"
    # click_button "Update Army"
    # page.should have_content "125"
#army_squads_attributes_0_troops_attributes_0_weapon".
#page.should have_selector('#blah', visible: true)
