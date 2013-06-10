RSpec::Matchers.define :match_exactly do |expected_match_count, selector|

    match do |context|
        matching = context.all(selector)
        @matched = matching.size
        @matched == expected_match_count
    end

    failure_message_for_should do
        "expected '#{selector}' to match exactly #{expected_match_count} elements, but matched #{@matched}"
    end

    failure_message_for_should_not do
        "expected '#{selector}' to NOT match exactly #{expected_match_count} elements, but it did"
    end
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

def points
    page.find("div.squadpoints")
end

def squad_leader
    page.find("div.fields.squad table tr:nth-child(1) select")
end

def squad_leader_weapon
    page.find("div.fields.squad table tr:nth-child(1) select")['value']
end

def squad_troop(number)
    page.find("div.fields.squad table tr:nth-child(#{number}) select")
end

def troop_weapon(number)
    page.find("div.fields.squad table tr:nth-child(#{number}) select")['value']
end

def give_troop_weapon_and_check_value(number, weapon)
    squad_troop(number).select weapon
    troop_weapon(number).should == weapon
end

def give_troop_weapon_and_check_wrong_value(number, weapon, correct_weapon)
    squad_troop(number).select weapon
    troop_weapon(number).should == correct_weapon
end
