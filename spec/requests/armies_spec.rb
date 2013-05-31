require 'spec_helper'

describe Army do
  before(:each) do
    visit armies_path
    click_link "New Army"
  end

  # it "should only allow 20 marines in squad using the add troop and remove troop button", :js => true  do
  #   visit armies_path
  #   click_link "New Army"
  #   page.should have_content "New army" #Jumpstarts JAVASCRIPT
  #   page.should match_exactly(2, ".input.select.optional.army_squads_troops_weapon")
  #   select "Marine", from: "army_squads_attributes_0_name"
  #   page.should match_exactly(1, "#army_squads_attributes_0_name")
  #   page.should match_exactly(6, ".input.select.optional.army_squads_troops_weapon")
  #   3.times { click_link "Add Troop" }
  #   page.should match_exactly(9, ".input.select.optional.army_squads_troops_weapon")
  #   click_link "remove"
  #   page.should match_exactly(8, ".input.select.optional.army_squads_troops_weapon")
  #   18.times { click_link "Add Troop" }
  #   page.should match_exactly(21, ".input.select.optional.army_squads_troops_weapon")
  # end


  it "should have correct marine weapon select options for basic squad", :js => true  do

    page.find("#army_squads_attributes_0_name").select "Marine"
    page.find("div.fields.squad table tr:nth-child(1) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "basic"
    page.find("div.fields.squad table tr:nth-child(1) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "special"
    page.find("div.fields.squad table tr:nth-child(2) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "basic"
    page.find("div.fields.squad table tr:nth-child(1) select").select "boltgun"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "basic"
    page.find("div.fields.squad table tr:nth-child(2) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "basic"
    page.find("div.fields.squad table tr:nth-child(2) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "special"
    page.find("div.fields.squad table tr:nth-child(1) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "basic"
  end
end


    # page.find("div.input.select.optional.army_squads_troops_weapon").select "meltagun"
    # 5.times { click_link "Add Troop" }
    # select "cannon", from: "army_squads_attributes_0_troops_attributes_0_weapon"
    # page.find("#army_squads_attributes_0_troops_attributes_0_weapon")['value'].should == "heavy"
    # page.find("div.input.select.optional.army_squads_troops_weapon:first").select "meltagun"

    # should have_selector(:title, text: "|")
    # page.has_selector?('.army_squads_attributes_0_name')


