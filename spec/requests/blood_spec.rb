require 'spec_helper'

describe Army do
  before(:each) do
    visit armies_path
    click_link "blood Army"
  end

    it "allow max of 20 troops in Squad and Min of 5 troops", :js => true  do
      click_link "add_heavyweapon"
      squads = page.all(".squad")
      squads[0].find(".army_squads_name select").select "Marine"
      confirm_squad_troop_count(5, squads[0])
      test_max_min_squad_size(20, 5, squads[0])
    end

end