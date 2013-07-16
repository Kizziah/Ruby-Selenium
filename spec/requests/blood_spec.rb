require 'spec_helper'

describe Army do
  before(:each) do
    visit armies_path
    click_link 'Blood Angel Army'
  end

  describe "Tactical Squad" do

    it "allow max of 10 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Tactical"
      confirm_squad_troop_count(5, squads[0])
      test_max_min_squad_size(10, 5, squads[0])
    end

    it "should be a Troop squad", :js => true do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Tactical"
      squads[0].find(".squadtype").should have_content "Troop"
    end

  end

  describe "Scout Squad" do
    it "allow max of 15 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Scout"
      confirm_squad_troop_count(5, squads[0])
      test_max_min_squad_size(15, 5, squads[0])
    end

    it "should be a Troop squad", :js => true do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Scout"
      squads[0].find(".squadtype").should have_content "Troop"
    end

  end

  describe "Devastator Squad" do

    it "allow max of 5 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Devastator"
      confirm_squad_troop_count(5, squads[0])
    end

    it "should be a Troop squad", :js => true do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Devastator"
      squads[0].find(".squadtype").should have_content "Troop"
    end

  end

  describe "Terminator Squad" do

    it "allow max of 10 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Terminator"
      confirm_squad_troop_count(5, squads[3])
      test_max_min_squad_size(10, 5, squads[3])
    end

    it "should be an Elite squad", :js => true do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Terminator"
      squads[3].find(".squadtype").should have_content "Elite"
    end

  end

  describe "Stern Guard Squad" do

    it "allow max of 10 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Stern Guard"
      confirm_squad_troop_count(5, squads[3])
      test_max_min_squad_size(10, 5, squads[3])
    end

    it "should be an Elite squad", :js => true do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Stern Guard"
      squads[3].find(".squadtype").should have_content "Elite"
    end

  end  

  describe "Assualt Squad" do

    it "allow max of 10 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Assualt"
      confirm_squad_troop_count(5, squads[3])
      test_max_min_squad_size(15, 5, squads[3])
    end

    it "should be an Elite squad", :js => true do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Assualt"
      squads[3].find(".squadtype").should have_content "Fast"
    end
  end

  describe "Biker Squad" do

    it "allow max of 10 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Biker"
      confirm_squad_troop_count(3, squads[3])
      test_max_min_squad_size(12, 3, squads[3])
    end

    it "should be an Elite squad", :js => true do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Biker"
      squads[3].find(".squadtype").should have_content "Fast"
    end

  end

end