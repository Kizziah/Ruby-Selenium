require 'spec_helper'

describe Army do
  before(:each) do
    visit armies_path
    click_link "New Army"
  end

  describe "Marine Squad" do

    it "allow max of 20 troops in Squad and Min of 5 troops", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Marine"
      confirm_squad_troop_count(5, squads[0])
      test_max_min_squad_size(20, 5, squads[0])
    end

    it "should have the correct troop images", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Marine"
      champion = squads[0].find("table").find("td:nth-child(1)")
      champion.find(".troop_icon")['class'].should == "troop_icon champion"
      gunny = squads[0].find("table").find("tr:nth-child(2)").find("td").find(".troop_icon")
      gunny['class'].should == "troop_icon gunny"
      havoc = squads[0].find("table").find("tr:nth-child(3)").find("td").find(".troop_icon")
      havoc['class'].should == "troop_icon choasmarine"
      5.times { squads[0].find(".add_troop").click }
      havoc['class'].should == "troop_icon havoc"
      squads[0].find(".remove_troop").click
      havoc['class'].should == "troop_icon havoc choasmarine"
      gunny['class'].should == "troop_icon gunny"
      squads[0].find(".add_troop").click
      havoc['class'].should == "troop_icon havoc"
    end

    it "only allow heavy weapon when size is 10 or greater", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      page.find("#army_squads_attributes_0_name").select "Marine"
      give_troop_weapon_and_check_value(1, "plasmapistol")
      5.times { click_link "Add Troop" }
      give_troop_weapon_and_check_value(3, "lascannon")
      click_link "remove"
      troop_weapon(3).should == "boltgun"
      give_troop_weapon_and_check_value(2, "meltagun")
    end

    it "calculate squad with correct points", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      page.find("#army_squads_attributes_0_name").select "Marine"
      points.should have_content "75"
      give_troop_weapon_and_check_value(1, "plasmapistol")
      points.should have_content "90"
      click_link "Add Troop"
      points.should have_content "103"
      4.times { click_link "Add Troop" }
      points.should have_content "155"
      give_troop_weapon_and_check_value(1, "boltpistol")
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
      page.find(".army_faction select").select "Choas Force"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Cultist"
      test_max_min_squad_size(35, 10, squads[0])
    end

    it "should calculate correct points", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Cultist"
      squads[0].find(".squadpoints").should have_content "50"
      squads[0].find(".add_troop").click
      squads[0].find(".squadpoints").should have_content "54"
      squads[0].find(".remove_troop").click
      squads[0].find(".squadpoints").should have_content "50"
    end

    it "should allow 1 flamer for every 10 troops", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Cultist"
      gunny1 = squads[0].find("table").find("tr:nth-child(2)").find("td").find(".troop_icon")
      gunny1['class'].should == "troop_icon gunny"
      squads[0].find("table").find("tr:nth-child(2) select").select "flamer"
      10.times {squads[0].find(".add_troop").click}
      squads[0].find("table").find("tr:nth-child(3) select").select "flamer"
      squads[0].find("table").find("tr:nth-child(3)").find("td").find(".troop_icon")['class'].should == "troop_icon choasmarine gunny"
      squads[0].find(".remove_troop").click
      squads[0].find("table").find("tr:nth-child(3)").find("td").find(".troop_icon")['class'].should == "troop_icon choasmarine"
      11.times {squads[0].find(".add_troop").click}
      squads[0].find("table").find("tr:nth-child(4)").find("td").find(".troop_icon")['class'].should == "troop_icon choasmarine gunny"
      squads[0].find(".remove_troop").click
      squads[0].find("table").find("tr:nth-child(4)").find("td").find(".troop_icon")['class'].should == "troop_icon choasmarine"
      squads[0].find("table").find("tr:nth-child(3) select").select "flamer"

    end
  end

  describe "Havoc" do
    it "should allow max 10 troops min of 5", :js => true do
      page.find(".army_faction select").select "Choas Force"
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Havoc"
      test_max_min_squad_size(10, 5, squads[3])
    end

    it "should have correct images", :js => true do
      page.find(".army_faction select").select "Choas Force"
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Havoc"
      champion = squads[3].find("table").find("td:nth-child(1)")
      champion.find(".troop_icon")['class'].should == "troop_icon champion"
      havoc1 = squads[3].find("table").find("tr:nth-child(2)").find("td").find(".troop_icon")
      havoc1['class'].should == "troop_icon havoc"
      havoc2 = squads[3].find("table").find("tr:nth-child(3)").find("td").find(".troop_icon")
      havoc2['class'].should == "troop_icon havoc"
      havoc3 = squads[3].find("table").find("tr:nth-child(4)").find("td").find(".troop_icon")
      havoc3['class'].should == "troop_icon havoc"
      havoc4 = squads[3].find("table").find("tr:nth-child(5)").find("td").find(".troop_icon")
      havoc4['class'].should == "troop_icon havoc"
      2.times { squads[3].find(".add_troop").click }
      troop = squads[3].find("table").find("tr:nth-child(6)").find("td").find(".troop_icon")
      troop['class'].should == "troop_icon choasmarine"
    end
  end

  describe "Thousand Son" do
    it "should allow max 35 troops min of 10", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Thousand Son"
      test_max_min_squad_size(20, 5, squads[3])
    end

    it "should be classified as a Troop squad when a Sorcerer is included", :js => true do
      page.find(".army_faction select").select "Choas Force"
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Thousand Son"
      squads[3].find("h4").should have_content "Elite"
      squads[2].find(".army_squads_name select").select "Sorcerer"
      squads[3].find("h4").should have_content "Troops"
      squads[2].find(".army_squads_name select").select "Kharn"
      squads[3].find("h4").should have_content "Elite"
    end
  end

  describe "Berzerker" do
    it "should allow max 20 troops min of 5", :js => true do
      page.find(".army_faction select").select "Choas Force"
      click_link "add_elite"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Berzerker"
      test_max_min_squad_size(20, 5, squads[3])
      squads[3].find("h4").should have_content "Elite"
      squads[2].find(".army_squads_name select").select "Kharn"
      squads[3].find("h4").should have_content "Troops"
      squads[2].find(".army_squads_name select").select "Sorcerer"
      squads[3].find("h4").should have_content "Elite"

    end
  end
end



    # it "should create havoc and marine squad", :js => true do
    #     page.find(".army_faction select").select "Choas Force"
    #     click_link "add_heavyweapon"
    #     squads = page.all(".squad")
    #     squads[2].find(".army_squads_name select").select "Havoc"
    #     squads[2].find(".squadpoints").should have_content "75"
    #     # give_troop_weapon_and_check_value(2, "meltagun")
    #     # give_troop_weapon_and_check_value(3, "flamer")
    #     # give_troop_weapon_and_check_value(4, "lascannon")
    #     # give_troop_weapon_and_check_value(5, "lascannon")
    #     # points.should have_content "130"
    #     # 4.times { click_link "Add Troop" }
    #     # points.should have_content "182"
    #     # 4.times { click_link "remove" }
    #     # points.should have_content "130"
    #     # click_link "add_squad"
    #     # squads = page.all(".squad")
    #     squads[1].find(".army_squads_name select").select "Marine"
    #     squads[1].find("div.squadpoints").should have_content "75"
    #     squads[1].find("table tr:nth-child(1) select").select "plasmapistol"
    #     squads[1].find("div.squadpoints").should have_content "90"

    # end
  # end
# end




      # give_troop_weapon_and_check_value(2, "lascannon")
      # points.should have_content "110"

    # page.has_selector?('.army_squads_attributes_0_name')


