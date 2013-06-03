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
    squad_leader.select "plasmapistol"
    squad_leader_weapon.should == "plasmapistol"
    squad_troop(2).select "cannon"
    troop_weapon(2).should == "boltgun"
    give_troop_weapon_and_check_value(2, "meltagun")
    give_troop_weapon_and_check_wrong_value(3, "meltagun", "boltgun")
    give_troop_weapon_and_check_value(2, "boltgun")
    give_troop_weapon_and_check_wrong_value(3, "cannon", "boltgun")
    give_troop_weapon_and_check_value(3, "meltagun")
    give_troop_weapon_and_check_wrong_value(2, "flamer", "boltgun")
    5.times { click_link "Add Troop" }
    give_troop_weapon_and_check_value(2, "flamer")
  end

 it "should have correct marine weapon select options for squad with a heavyweapon", :js => true  do
    page.find("#army_squads_attributes_0_name").select "Marine"
    page.find("div.fields.squad table tr:nth-child(1) select").select "plasmapistol"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "plasmapistol"
    give_troop_weapon_and_check_wrong_value(3, "cannon", "boltgun")
    page.should match_exactly(6, ".input.select.optional.army_squads_troops_weapon")
    give_troop_weapon_and_check_value(3, "meltagun")
    7.times { click_link "Add Troop" }
    page.should match_exactly(13, ".input.select.optional.army_squads_troops_weapon")
    give_troop_weapon_and_check_value(3, "flamer")
    give_troop_weapon_and_check_value(6, "cannon")
    give_troop_weapon_and_check_wrong_value(7, "cannon", "boltgun")
    give_troop_weapon_and_check_value(3, "meltagun")
    give_troop_weapon_and_check_wrong_value(3, "cannon", "meltagun")
    troop_weapon(6).should == "cannon"
    give_troop_weapon_and_check_wrong_value(2, "flamer", "boltgun")
    give_troop_weapon_and_check_wrong_value(2, "cannon", "boltgun")
    give_troop_weapon_and_check_value(6, "meltagun")
    give_troop_weapon_and_check_value(6, "cannon")
    give_troop_weapon_and_check_wrong_value(5, "meltagun", "boltgun")
    4.times { click_link "Add Troop" }
    give_troop_weapon_and_check_wrong_value(9, "flamer", "boltgun")
 end

  it "should remove correct weapon when squad is reduced under 10 troops", :js => true  do
    page.find("#army_squads_attributes_0_name").select "Marine"
    page.find("div.fields.squad table tr:nth-child(1) select").select "plasmapistol"
    page.find("div.fields.squad table tr:nth-child(1) select")['value'].should == "plasmapistol"
    5.times { click_link "Add Troop" }
    give_troop_weapon_and_check_value(2, "cannon")
    give_troop_weapon_and_check_value(3, "flamer")
    click_link "remove"
    troop_weapon(2).should == "boltgun"
    give_troop_weapon_and_check_wrong_value(2, "flamer", "boltgun")
    click_link "Add Troop"
    give_troop_weapon_and_check_value(2, "meltagun")
    click_link "remove"
    troop_weapon(3).should == "boltgun"
    give_troop_weapon_and_check_value(2, "flamer")
    give_troop_weapon_and_check_wrong_value(2, "cannon", "flamer")
    give_troop_weapon_and_check_value(2, "meltagun")
    give_troop_weapon_and_check_wrong_value(3, "cannon", "boltgun")
    give_troop_weapon_and_check_wrong_value(3, "flamer", "boltgun")
  end

    it "should remove correct weapon when squad is reduced under 10 troops", :js => true  do

    end
end

    # page.has_selector?('.army_squads_attributes_0_name')


