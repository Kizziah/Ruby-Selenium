require 'spec_helper'

describe Army do
  before(:each) do
    visit armies_path
    click_link "New Army"
  end

  def confirm_squad_troop_count(x, squad)
    table = squad.find("table")
    y = 1
    x.times do
      table.find("tr:nth-child(#{y})")
      y += 1
    end
    y -= 1
    y.should == x
    x += 1
    table.find("tr:nth-child(#{x})") rescue x = true
    x.should == true
  end

  def test_max_min_squad_size(max, min, squad)
    troops_to_add = max - min
    troops_to_add.times { squad.find(".add_troop").click }
    squad.find(".add_troop").visible?.should == false
    confirm_squad_troop_count(max, squad)
    min_math = 0
    min_math = min - max
    math = min_math.abs
    math.times {squad.find(".remove_troop").click }
    confirm_squad_troop_count(min, squad)
    squad.find(".remove_troop").visible?.should == false
    squad.find(".add_troop").visible?.should == true

  end

  describe "Marine Squad" do

     it "allow max of 20 troops in Squad and Min of 5 troops", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Marine"
      confirm_squad_troop_count(5, squads[0])
      test_max_min_squad_size(20, 5, squads[0])
     end

    it "only allow heavy weapon when size is 10 or greater", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      page.find("#army_squads_attributes_0_name").select "Marine"
      give_troop_weapon_and_check_value(1, "plasmapistol")
      5.times { click_link "Add Troop" }
      give_troop_weapon_and_check_value(3, "cannon")
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
      give_troop_weapon_and_check_value(3, "cannon")
      points.should have_content "170"
      click_link "remove"
      points.should have_content "137"
      click_link "Add Troop"
      points.should have_content "150"
      give_troop_weapon_and_check_value(3, "cannon")
      points.should have_content "170"
    end

  describe "Havoc" do
    it "should allow max 10 troops min of 5", :js => true  do
      page.find(".army_faction select").select "Choas Force"
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[3].find(".army_squads_name select").select "Havoc"
      test_max_min_squad_size(10, 5, squads[3])
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

  end


  # describe "Thousand Son" do
  #   it "should allow max 35 troops min of 10", :js => true  do
  #     page.find(".army_faction select").select "Choas Force"
  #     squads = page.all(".squad")
  #     squads[0].find(".army_squads_name select").select "Cultist"
  #     test_max_min_squad_size(36, 10, squads[0])
  #   end
  # end

end
    # it "should only have 4 havoc in squad no matter size", :js => true  do
    #     page.find(".army_faction select").select "Choas Force"
    #     click_link "add_heavyweapon"
    #     squads = page.all(".squad")
    #     squads[2].find(".army_squads_name select").select "Havoc"
    #     squads[2].find(".squadpoints").should have_content "75"
    # #   give_troop_weapon_and_check_value(2, "meltagun")
    # #   give_troop_weapon_and_check_value(3, "flamer")
    # #   give_troop_weapon_and_check_value(4, "cannon")
    # #   give_troop_weapon_and_check_value(5, "cannon")
    # #   points.should have_content "130"
    # #   4.times { click_link "Add Troop" }
    # #   points.should have_content "182"
    # #   4.times { click_link "remove" }
    # #   points.should have_content "130"
    # end

    # it "should create havoc and marine squad", :js => true do
    #     page.find(".army_faction select").select "Choas Force"
    #     click_link "add_heavyweapon"
    #     squads = page.all(".squad")
    #     squads[2].find(".army_squads_name select").select "Havoc"
    #     squads[2].find(".squadpoints").should have_content "75"
    #     # give_troop_weapon_and_check_value(2, "meltagun")
    #     # give_troop_weapon_and_check_value(3, "flamer")
    #     # give_troop_weapon_and_check_value(4, "cannon")
    #     # give_troop_weapon_and_check_value(5, "cannon")
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
end

      # give_troop_weapon_and_check_value(2, "cannon")
      # points.should have_content "110"

    # page.has_selector?('.army_squads_attributes_0_name')


