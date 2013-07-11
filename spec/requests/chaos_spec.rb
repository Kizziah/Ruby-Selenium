  require 'spec_helper'

describe Army do
  before(:each) do
    visit armies_path
    click_link "Chaos Army"
  end

  describe "Marine Squad" do
    
    it "allow max of 20 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Marine"
      confirm_squad_troop_count(5, squads[0])
      test_max_min_squad_size(20, 5, squads[0])
    end

    it "should have the correct troop images", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Marine"
      champion = squads[0].find("table").find("td:nth-child(1)")
      5.times { squads[0].find(".add_troop").click }
      squads[0].find(".remove_troop").click
    end

    it "only allow heavy weapon when size is 10 or greater", :js => true  do
      page.find("#army_squads_attributes_0_name").select "Marine"
      5.times { click_link "Add Troop" }
      give_troop_weapon_and_check_value(3, "lascannon")
      click_link "remove"
      troop_weapon(3).should == "boltgun"
      give_troop_weapon_and_check_value(2, "meltagun")
    end

    it "calculate squad with correct points", :js => true  do
      click_link "add_heavyweapon"
      page.find("#army_squads_attributes_0_name").select "Marine"
      points.should have_content "75"
      click_link "Add Troop"
      points.should have_content "88"
      4.times { click_link "Add Troop" }
      points.should have_content "140"
      points.should have_content "140"
      give_troop_weapon_and_check_value(2, "meltagun")
      points.should have_content "150"
      give_troop_weapon_and_check_value(3, "lascannon")
      points.should have_content "170"
      click_link "remove"
      points.should have_content "137"
      click_link "Add Troop"
      points.should have_content "150"
      give_troop_weapon_and_check_value(3, "lascannon")
      points.should have_content "170"
    end
  end

  describe "Cultist" do
    it "should allow max 35 troops min of 10", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Cultist"
      test_max_min_squad_size(35, 10, squads[0])
    end

    it "should calculate correct points", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Cultist"
      squads[0].find(".squadpoints").should have_content "50"
      squads[0].find(".add_troop").click
      squads[0].find(".squadpoints").should have_content "54"
      squads[0].find(".remove_troop").click
      squads[0].find(".squadpoints").should have_content "50"
    end

    it "should allow 1 flamer for every 10 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Cultist"
      squads[0].find("table").find("tr:nth-child(2) select").select "flamer"
      10.times {squads[0].find(".add_troop").click}
      squads[0].find("table").find("tr:nth-child(3) select").select "flamer"
      squads[0].find(".remove_troop").click
      11.times {squads[0].find(".add_troop").click}
      squads[0].find(".remove_troop").click
      squads[0].find("table").find("tr:nth-child(3) select").select "flamer"

    end
  end

  describe "Havoc" do
    it "should allow max 10 troops min of 5", :js => true do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[1].find(".army_squads_name select").select "Havoc"
      give_troop_weapon_and_check_value(2, "lascannon")

      test_max_min_squad_size(10, 5, squads[1])
    end
  end

  describe "Thousand Son" do
    it "should allow max 20 troops min of 5", :js => true  do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Thousand Son"
      test_max_min_squad_size(20, 5, squads[3])
    end

    it "should be classified as a Troop squad when a Sorcerer is included", :js => true do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Thousand Son"
    end
  end

  describe "Berzerker" do
    it "should allow max 20 troops min of 5", :js => true do
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Berzerker"
      test_max_min_squad_size(20, 5, squads[3])
    end
  end

  describe "Warp Talon" do
    it "should allow max 10 troops min of 5", :js => true  do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Warp Talon"
      test_max_min_squad_size(10, 5, squads[3])
    end

    it "should calculate correct points", :js => true  do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Warp Talon"
    end
  end

  describe "Raptor" do
    it "should allow max 10 troops min of 5", :js => true  do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Raptor"
      test_max_min_squad_size(10, 5, squads[3])
    end
  end

  describe "Chaos Biker" do
    it "should allow max 10 troops min of 3", :js => true  do
      click_link "add_fastattack"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Choas Biker"
      test_max_min_squad_size(10, 3, squads[3]) 
    end
  end

end
