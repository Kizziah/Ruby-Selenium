require 'spec_helper'

describe Army do
  before(:each) do
    visit armies_path
    click_link "New Army"
  end


  it "should only allow 20 marines in squad using the add troop and remove troop button", :js => true  do
    page.should have_content "New army" #Jumpstarts JAVASCRIPT
    page.should match_exactly(2, ".input.select.optional.army_squads_troops_weapon")
    select "Marine", from: "army_squads_attributes_0_name"
    page.should match_exactly(1, "#army_squads_attributes_0_name")
    page.should match_exactly(6, ".input.select.optional.army_squads_troops_weapon")
    3.times { click_link "Add Troop" }
    page.should match_exactly(9, ".input.select.optional.army_squads_troops_weapon")
    click_link "remove"
    page.should match_exactly(8, ".input.select.optional.army_squads_troops_weapon")
    18.times { click_link "Add Troop" }
    page.should match_exactly(21, ".input.select.optional.army_squads_troops_weapon")
  end

  it "should have correct marine weapon select options for basic squad", :js => true  do
    page.find("#army_squads_attributes_0_name").select "Marine"
    page.find("div.fields.squad table tr:nth-child(1) select").select "plasmapistol"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "plasmapistol"
    page.find("div.fields.squad table tr:nth-child(2) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(2) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "meltagun"
    page.find("div.fields.squad table tr:nth-child(3) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(2) select").select "boltgun"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(3) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(3) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "meltagun"
    page.find("div.fields.squad table tr:nth-child(2) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "boltgun"
    5.times { click_link "Add Troop" }
    page.find("div.fields.squad table tr:nth-child(2) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "flamer"
  end

 it "should have correct marine weapon select options for squad with a heavyweapon", :js => true  do
    page.find("#army_squads_attributes_0_name").select "Marine"
    page.find("div.fields.squad table tr:nth-child(1) select").select "plasmapistol"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "plasmapistol"
    page.find("div.fields.squad table tr:nth-child(3) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "boltgun"
    page.should match_exactly(6, ".input.select.optional.army_squads_troops_weapon")
    page.find("div.fields.squad table tr:nth-child(3) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "meltagun"
    7.times { click_link "Add Troop" }
    page.should match_exactly(13, ".input.select.optional.army_squads_troops_weapon")
    page.find("div.fields.squad table tr:nth-child(3) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "flamer"
    page.find("div.fields.squad table tr:nth-child(6) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(6) select")['value'].should == "cannon"
    page.find("div.fields.squad table tr:nth-child(7) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(7) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(3) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "meltagun"
    page.find("div.fields.squad table tr:nth-child(3) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "meltagun"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "meltagun"
    page.find("div.fields.squad table tr:nth-child(6) select")['value'].should == "cannon"
    page.find("div.fields.squad table tr:nth-child(2) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(2) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(6) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(6) select")['value'].should == "meltagun"
    page.find("div.fields.squad table tr:nth-child(6) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(6) select")['value'].should == "cannon"
    page.find("div.fields.squad table tr:nth-child(5) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(5) select")['value'].should == "boltgun"
    4.times { click_link "Add Troop" }
    page.find("div.fields.squad table tr:nth-child(9) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(9) select")['value'].should == "boltgun"
 end

  it "should remove correct weapon when squad is reduced under 10 troops", :js => true  do
    page.find("#army_squads_attributes_0_name").select "Marine"
    page.find("div.fields.squad table tr:nth-child(1) select").select "plasmapistol"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "plasmapistol"
    5.times { click_link "Add Troop" }
    page.find("div.fields.squad table tr:nth-child(2) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "cannon"
    page.find("div.fields.squad table tr:nth-child(3) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "flamer"
    click_link "remove"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(2) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "boltgun"
    click_link "Add Troop"
    page.find("div.fields.squad table tr:nth-child(2) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "meltagun"
    click_link "remove"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(2) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "flamer"
    page.find("div.fields.squad table tr:nth-child(2) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "flamer"
    page.find("div.fields.squad table tr:nth-child(2) select").select "meltagun"
    page.find("div.fields.squad table tr:nth-child(2) select")['value'].should == "meltagun"
    page.find("div.fields.squad table tr:nth-child(3) select").select "cannon"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "boltgun"
    page.find("div.fields.squad table tr:nth-child(3) select").select "flamer"
    page.find("div.fields.squad table tr:nth-child(3) select")['value'].should == "boltgun"
  end

end

    # page.find("div.input.select.optional.army_squads_troops_weapon").select "meltagun"
    # 5.times { click_link "Add Troop" }
    # select "cannon", from: "army_squads_attributes_0_troops_attributes_0_weapon"
    # page.find("#army_squads_attributes_0_troops_attributes_0_weapon")['value'].should == "heavy"
    # page.find("div.input.select.optional.army_squads_troops_weapon:first").select "meltagun"

    # should have_selector(:title, text: "|")
    # page.has_selector?('.army_squads_attributes_0_name')


