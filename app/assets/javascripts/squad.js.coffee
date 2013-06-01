jQuery ->

  #Marine Options
  #
  basicMarineWeapons = [
    "boltgun",
    "meltagun",
    "plasmagun",
    "flamer",
    "cannon"
  ]

  basicMarineLeaderWeapons = [
    "boltpistol",
    "plasmapistol",
    "plasmagun"
  ]

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
      field: troopClone.find('.army_squads_troops_weapon select')
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

  create_default_marine_squad = (opts = {}) ->
    _.times(4, -> generateTroop(troop: opts.troop))
    troops = opts.location.find('.army_squads_troops_weapon select')
    troops.empty()

    weaponsArray = basicMarineWeapons
    squadSelect = ""
    $.each weaponsArray, (i) ->
      squadSelect += "<option value=\"" + weaponsArray[i] + "\">" + weaponsArray[i] + "</option>"
    troops.append squadSelect

    table = troops.closest(".squad")
    leader = table.find(" table tr:nth-child(1)")
    leader.find(".army_squads_troops_weapon select").empty()
    weaponsArray = basicMarineLeaderWeapons

    leaderSelect = ""

    $.each weaponsArray, (i) ->
      leaderSelect += "<option value=\"" + weaponsArray[i] + "\">" + weaponsArray[i] + "</option>"
    leader.find(".army_squads_troops_weapon select").append leaderSelect
    leader.find("a.remove_troop").hide()
    table.find(" table tr:nth-child(1)").find(".info").text("Squad Champion")

    troops = table.find(" table tr:gt(1)")
    troops.each ->
      $(this).find("a.remove_troop").hide()
    normalTroops = table.find(" table tr:gt(1)")

    normalTroops.find("select option").each ->
      $(this).attr("disabled", true) if $(this).val() is "cannon"

  addMarineSquadRules = (opts = {}) ->
    max = 20
    squadFull = (max - opts.size) is 0
    generateTroop unless squadFull
      troop: opts.troop
      weapon: "boltgun"


  marineWeaponRules = (opts = {}) ->
    special = 0
    heavy = 0
    size = opts.size
    troops = opts.troops
    weapons = opts.weapons
    normalTroops = opts.normalTroops
    leaderTroop = opts.leaderTroop

    normalTroops.find("select").each ->
      $(this).attr("disabled", false)
    normalTroops.find("select option").each ->
      $(this).attr("disabled", false)

    countWeaponTypes = ->
      special = 0
      heavy = 0
      normalTroops.find("select").each ->
        special++ if $(this).val() is "plasmagun" or $(this).val() is "meltagun" or $(this).val() is "flamer" or $(this).val() is "cannon"
        heavy++ if $(this).val() is "cannon"

    countWeaponTypes ->
    if special is 1 and size < 10
      normalTroops.find("select").each -> #allows special to still select itself
        $(this).attr("disabled", true) unless $(this).val() is "flamer" or $(this).val() is "plasmagun" or $(this).val() is "meltagun"
    countWeaponTypes ->
    if size >= 10 and heavy is 1
      normalTroops.find("select").each ->
        $(this).find("option").attr("disabled", false) unless $(this).val() is "cannon"
    countWeaponTypes ->
    if special is 2
      normalTroops.find("select").each ->
        $(this).attr("disabled", true) unless $(this).val() is "flamer" or $(this).val() is "plasmagun" or $(this).val() is "meltagun" or $(this).val() is "cannon"
    if size < 10
      normalTroops.find("select").each ->
        $(this).val("boltgun") if $(this).val() is "cannon"
    countWeaponTypes ->
    if size < 10 and special is 2
      normalTroops.find("select").each ->
        $(this).val("boltgun") if $(this).val() is "flamer" or $(this).val() is "plasmagun" or $(this).val() is "meltagun"
    if size < 10
       normalTroops.find("select option").each ->
        $(this).attr("disabled", true) if $(this).val() is "cannon"
    countWeaponTypes ->
    if heavy is 1
      normalTroops.find("select option").each ->
        $(this).attr("disabled", true) if $(this).val() is "cannon"


    # console.log  heavy  + "HEAVY"
    # console.log  special + "Special"

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
      normalTroops: squad.find(" table tr:gt(1)")
      leaderTroop: squad.find(" table tr:nth-child(1)")

  $(".remove_troop").click ->
    event.preventDefault()
    location = $(this).closest(".squad")
    squad = getSquadInfo(location)
    $(this).closest("tr").remove()
    squad = getSquadInfo(location)
    marineWeaponRules(troops: squad.troops, size: squad.size, type: squad.type, weapons: squad.weapons, normalTroops: squad.normalTroops, leaderTroop: squad.leaderTroop)

  $(".add_troop").click ->
    event.preventDefault()
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    addMarineSquadRules(size: squad.size, troop: squad.troop)
    newSquad = getSquadInfo(currentSquad)
    marineWeaponRules(troops: newSquad.troops, size: newSquad.size, type: newSquad.type, weapons: newSquad.weapons, normalTroops: newSquad.normalTroops, leaderTroop: newSquad.leaderTroop)
    table = $(this).closest(".squad")
    extratroops = table.find(" table tr:gt(5)")
    extratroops.each ->
      $(this).find("a.remove_troop").show()

  $(".army_squads_troops_weapon select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    marineWeaponRules(troops: squad.troops, size: squad.size, type: squad.type, weapons: squad.weapons, normalTroops: squad.normalTroops, leaderTroop: squad.leaderTroop)

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
      create_default_marine_squad(troop: squad.troop, location: currentSquad )
  $("#click").click ->
      #   $.each opts.weaponOptions, (key, value) ->
  #     opts.troops.append $("<option></option>").attr("value", value).text(key)
