jQuery ->

  #Marine Options
  #
  Marine =
    basicMarineWeapons:
      "boltgun": 1
      "meltagun": 2
      "plasmagun": 2
      "flamer": 2
      "cannon": 3

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



  havocRules = (opts = {}) ->
    max = 10
    limit = max - opts.size
    generateTroop unless limit is 0
      troop: opts.troop
      weapon: "boltgun"



  create_default_havoc_squad = (opts = {}) ->
    _.times(4, -> generateTroop(troop: opts.troop, weapon: "boltgun"))

  create_default_marine_squad = (opts = {}) ->
    _.times(4, -> generateTroop(troop: opts.troop, weapon: "boltgun"))
    troops = opts.location.find('.army_squads_troops_weapon select')
    troops.empty()
    apply_weapons(troops: troops, weaponOptions: Marine.basicMarineWeapons)  # give squad weapons weapons selection

  marineRules = (opts = {}) ->
    max = 20
    squadFull = (max - opts.size) is 0
    generateTroop unless squadFull
      troop: opts.troop
      weapon: "boltgun"

  marine_weapon_rules = (opts = {}) ->
    disabledSelection = (opts = {}) ->
      opts.selection.attr("disabled", true)
    size = opts.size
    special = opts.special
    troops = opts.troops
    console.log size
    if special == 1 && size < 7
      troops.each ->
        disabledSelection(selection: $(this)) unless $(this).val() isnt "1"
    if special == 0
      troops.each ->
        $(this).attr("disabled", false)
    if size >= 7
       troops.each ->
        $(this).attr("disabled", false)
    if special == 2
      troops.each ->
        $(this).attr("disabled", true) unless $(this).val() isnt "1"


  countWeapons = (opts = {}) ->
    basic = 0
    special = 0
    weapons = []
    opts.troops.each ->
      special++ if $(this).val() isnt "1"
      weapons.push $(this).val()

    marine_weapon_rules(size: opts.size, special: special, troops: opts.troops) if opts.type is "marine"

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

  $(".remove_troop").click ->
    event.preventDefault()
    squad = $(this).closest(".squad")
    $(this).closest("tr").remove()
    size = squad.find("table tbody tr").size()
    squadType = squad.find(".army_squads_name select").val()
    troops = squad.find('.army_squads_troops_weapon select')
    countWeapons(troops: troops, size: newSize, type: squadType)

  $(".add_troop").click ->
    event.preventDefault()
    size = $(this).closest(".squad").find("table tbody tr").size()
    squadType = $(this).closest(".squad").find(".army_squads_name select").val()
    troop = $(this).closest(".squad").find("table tbody tr:last")

    marineRules(size: size, troop: troop) if squadType is "marine"
    havocRules(size: size, troop: troop) if squadType is "havoc"

    newSize = $(this).closest(".squad").find("table tbody tr").size()
    troops = $(this).closest(".squad").find('.army_squads_troops_weapon select')

    countWeapons(troops: troops, size: newSize, type: squadType)


  $(".army_squads_troops_weapon select").change ->
    type = $(this).closest(".squad").find(".army_squads_name select").val()
    size = $(this).closest(".squad").find('.army_squads_troops_weapon').size()
    troops = $(this).closest(".squad").find('.army_squads_troops_weapon select')
    countWeapons(troops: troops, size: size, type: type)

  $(".army_squads_name select").change ->
    size = $(this).closest(".squad").find("table tbody tr").size()
    while size > 1  # reset troops in squad for when squad changes types
      $(this).closest(".squad").find("table tbody tr:last").remove()
      size--

    type = $(this).val()
    troop = $(this).closest(".squad").find("table tbody tr:last")
    location = $(this).closest(".squad")
    if type is 'cultist'
      _.times(9, -> generateTroop(troop: troop))
    if type is 'marine'
      create_default_marine_squad(troop: troop, location: location)
    if type is 'havoc'
      create_default_havoc_squad(troop: troop, location: location)


  $("#click").click ->
    $(".squad").find(".army_squads_troops_weapon select option:contains(p)").attr "disabled", "disabled"
