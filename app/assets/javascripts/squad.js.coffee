jQuery ->

  #Marine Options
  #
  Marine =
    basicMarineWeapons:
      "boltgun": "basic"
      "meltagun": "special"
      "plasmagun": "special"
      "flamer": "special"
      "cannon": "heavy"

  # Renames the `id` and `name` attributes for a given field in order to work
  # properly with `accepts_nested_attributes_for` params.
  #
  # field   - Form element to be renamed.
  # matcher - Regular expression used to substitute the identification number
  #           used on the `field` attributes.
  # number  - Random number which will replace the current identification
  #           number.
  #
  renameField = (opts = {}) ->
    opts.field.attr('name', opts.field.attr('name').replace(opts.matcher, opts.number))
    opts.field.attr('id', opts.field.attr('id').replace(opts.matcher, opts.number))

  generateTroop = (opts = {}) ->
    troopClone = opts.troop.clone(true)
    renameField
      field: troopClone.find('.army_squads_troops_weapon select').val(opts.weapon)
      number: _.random(0, 100000)
      matcher: /(\d+)(?!.*\d)/
    opts.troop.after troopClone

  # Creates a hidden field that is placed as the last squad to be used as a
  # clean copy to prevent unwanted duplication.
  #
  create_squad_field_that_will_remain_hidden = do ->
    squadMatcher = /\d+/
    newNumber = _.random(0, 100000)
    squad = $(".fields.squad:last")
    squadClone = squad.clone(true)
    renameField
      field: squadClone.find('.army_squads_name select')
      number: newNumber
      matcher: squadMatcher
    renameField
      field: squadClone.find('.army_squads_troops_weapon select')
      number: newNumber
      matcher: squadMatcher
    squad.after squadClone
    squadClone.hide()

  # Changes troops weapons options
  #
  apply_weapons = (opts = {}) ->
    $.each opts.weaponOptions, (key, value) ->
      opts.troops.append $("<option></option>").attr("value", value).text(key)

  create_default_marine_squad = (opts = {}) ->
    _.times(4, -> generateTroop(troop: opts.troop, weapon: "boltgun"))
    troops = opts.location.find('.army_squads_troops_weapon select')
    troops.empty()
    apply_weapons(troops: troops, weaponOptions: Marine.basicMarineWeapons)  # give squad weapons weapons selection

    weapons = opts.location.find('.army_squads_troops_weapon select option')
    weapons.each ->
      if $(this).val() is "heavy"
        $(this).attr("disabled", true)
    table = troops.closest(".squad")
    leader = table.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select")
    leader.val("special") if leader.val() is "basic"

  addMarineSquadRules = (opts = {}) ->
    max = 20
    squadFull = (max - opts.size) is 0
    generateTroop unless squadFull
      troop: opts.troop
      weapon: "boltgun"



  marineWeaponRules = (opts = {}) ->
    size = opts.size
    special = 0
    heavy = 0
    troops = opts.troops
    weapons = opts.weapons
    table = opts.troops.closest(".squad")
    leader = table.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select")
    # leader.val("heavy")
    # leader.attr("boltgun")

    # console.log leader.val()
    leader.val("cannon") if leader.val() is "special"

    # countWeaponTypes = -> # determines weapon types of each squad memeber
    #   basic = 0
    #   special = 0
    #   heavy = 0
    #   troops.each ->
    #     special++ if $(this).val() isnt "basic"
    #     heavy++ if $(this).val() is "heavy"


    # addWeaponOption = (opts = {}) ->
    #   weapons.each ->
    #     $(this).attr("disabled", false) if $(this).val() is opts.weapon
    # removeWeaponOption = (opts = {}) ->
    #   weapons.each ->
    #     $(this).attr("disabled", true) if $(this).val() is opts.weapon
    # disableOptionSelector = (opts = {}) ->
    #   opts.weapon.attr("disabled", true) if opts.weapon.val() is "special"
    # onlyBasicWeapon = ->
    #   weapons.each ->
    #     disableOptionSelector(weapon: $(this)) if $(this).val() is "special"
    # removeHeavyWeapon = ->
    #   troops.each ->
    #     $(this).val("boltgun") if $(this).val() is "heavy"
    #   weapons.each ->
    #     $(this).attr("disabled", true) if $(this).val() is "heavy"
    #   countWeaponTypes ->
    # removeSpecialWeapon = ->
    #   troops.each ->
    #     $(this).val("boltgun") if $(this).val() is "special" unless special is 1
    #     countWeaponTypes ->

    # countWeaponTypes ->
    # weapons.each -> # Make sure all weapons have a value, prevents null bug.
    #   $(this).attr("disabled", false)

    # if size < 10
    #   removeHeavyWeapon ->
    #   countWeaponTypes ->
    # if special == 2 and size < 10
    #   removeSpecialWeapon ->
    # if special is 1
    #   onlyBasicWeapon ->
    # if special == 0
    #   weapons.each ->
    #     $(this).attr("disabled", false) if $(this).val() isnt "heavy"
    # if size >= 10
    #   addWeaponOption(weapon: "heavy")
    #   addWeaponOption(weapon: "special")
    # if special == 0
    #   weapons.each ->
    #     $(this).attr("disabled", false) if $(this).val() isnt "heavy"
    # if special == 2
    #   weapons.each ->
    #     $(this).attr("disabled", true) if $(this).val() isnt "basic"
    # countWeaponTypes ->
    # troops.each ->
    #   if $(this).val() is null
    #     $(this).closest('.army_squads_troops_weapon').find('select option').attr("disabled", false)
    # countWeaponTypes ->
    # if size < 10
    #   removeWeaponOption(weapon: "heavy")
    # if heavy is 1
    #   removeWeaponOption(weapon: "heavy")



  $("#add_squad").click ->
    event.preventDefault()
    squadMatcher = /\d+/
    newNumber = _.random(0, 100000)
    squad = $(".fields.squad:last")
    squadClone = squad.clone(true).show()
    renameField
      field: squadClone.find('.army_squads_name select')
      number: newNumber
      matcher: squadMatcher
    renameField
      field: squadClone.find('.army_squads_troops_weapon select')
      number: newNumber
      matcher: squadMatcher
    squad.before squadClone

  $(".remove_squad").click ->
    event.preventDefault()
    $(this).closest(".squad").remove()

  getSquadInfo = (squad) ->
    return do ->
      object: squad
      troops: squad.find('.army_squads_troops_weapon select')
      size: squad.find('.army_squads_troops_weapon').size()
      weapons: squad.find('.army_squads_troops_weapon select option')
      type: squad.find(".army_squads_name select").val()
      troop: squad.find("table tbody tr:last")

  $(".remove_troop").click ->
    event.preventDefault()
    location = $(this).closest(".squad")
    squad = getSquadInfo(location)
    $(this).closest("tr").remove() unless squad.size <= 5
    squad = getSquadInfo(location)
    marineWeaponRules(troops: squad.troops, size: squad.size, type: squad.type, weapons: squad.weapons) unless squad.size <= 5

  $(".add_troop").click ->
    event.preventDefault()
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    addMarineSquadRules(size: squad.size, troop: squad.troop)
    newSquad = getSquadInfo(currentSquad)
    marineWeaponRules(troops: newSquad.troops, size: newSquad.size, type: newSquad.type, weapons: newSquad.weapons)

  $(".army_squads_troops_weapon select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    marineWeaponRules(troops: squad.troops, size: squad.size, type: squad.type, weapons: squad.weapons)

  $(".army_squads_name select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    while squad.size > 1  # reset troops in squad for when squad changes types
      $(this).closest(".squad").find("table tbody tr:last").remove()
      squad.size--
    squad = getSquadInfo(currentSquad)
    if squad.type is 'cultist'
      _.times(9, -> generateTroop(troop: squad.troop))
    if squad.type is 'marine'
      create_default_marine_squad(troop: squad.troop, location: currentSquad)

  $("#click").click ->

