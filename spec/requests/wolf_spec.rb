require 'spec_helper'

describe Army do
  before(:each) do
    visit armies_path
    click_link 'Space Wolf Army'
  end

  describe "Grey Hunter Squad" do

    it "allow max of 10 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Grey Hunter"
      confirm_squad_troop_count(5, squads[0])
      test_max_min_squad_size(10, 5, squads[0])
    end

    it "should be a Troop squad", :js => true do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Grey Hunter"
      squads[0].find(".squadtype").should have_content "Troop"
    end

  end

  describe "Blood Claw Squad" do

    it "allow max of 15 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Blood Claw"
      confirm_squad_troop_count(5, squads[0])
      test_max_min_squad_size(15, 5, squads[0])
    end

    it "should be a Troop squad", :js => true do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Blood Claw"
      squads[0].find(".squadtype").should have_content "Troop"
    end

  end

  describe "Long Fang Squad" do

    it "allow max of 5 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Long Fang"
      confirm_squad_troop_count(5, squads[0])
    end

    it "should be a Troop squad", :js => true do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Long Fang"
      squads[0].find(".squadtype").should have_content "Troop"
    end

  end

  describe "Wolf Guard Squad" do

    it "allow max of 10 troops in Squad and Min of 3 troops", :js => true  do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Wolf Guard"
      confirm_squad_troop_count(3, squads[3])
      test_max_min_squad_size(10, 3, squads[3])
    end

    it "should be an Elite squad", :js => true do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Wolf Guard"
      squads[3].find(".squadtype").should have_content "Elite"
    end

  end

  describe "Lone Wolf" do

    it "be a 1 man squad", :js => true  do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Lone Wolf"
      test_max_min_squad_size(1, 1, squads[3])
    end

    it "should be an Elite squad", :js => true do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Lone Wolf"
      squads[3].find(".squadtype").should have_content "Elite"
    end

  end  

  describe "SkyClaw Squad" do

    it "allow max of 10 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "SkyClaw"
      confirm_squad_troop_count(5, squads[3])
      test_max_min_squad_size(15, 5, squads[3])
    end

    it "should be an Elite squad", :js => true do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "SkyClaw"
      squads[3].find(".squadtype").should have_content "Fast"
    end
  end

  describe "Wolfpack Squad" do

    it "allow max of 10 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Wolfpack"
      confirm_squad_troop_count(5, squads[3])
      test_max_min_squad_size(15, 3, squads[3])
    end

    it "should be an Elite squad", :js => true do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Wolfpack"
      squads[3].find(".squadtype").should have_content "Fast"
    end

  end

end