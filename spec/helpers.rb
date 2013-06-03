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
