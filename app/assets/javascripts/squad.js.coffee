basicMarineWeapons = [
  "boltgun"
]
gunnerWeapons = [
  "boltgun",
  "meltagun",
  "plasmagun",
  "flamer"
]
havocWeapons = [
  "boltgun"
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

choasHQ = [
  "Select Character",
  "Typhus",
  "Deamon Prince",
  "Kharn",
  "Sorcerer"
]

cultistWeapons = [
  "autopistol",
  "autogun"
]

choasTroops = [
  "Select Troop"
  "Marine",
  "Cultist"
]

choasHeavyWeapon = [
  "Select Heavy"
  "Havoc",
  "LandRaider"

]

thousandSonMarineWeapon = [
  "10k boltgun"
]

landRaiderMain = [
  "lascannon",
 ]

landRaiderSide = [
  "heavybolter",
]

choasEliteSquads = [
  "Select Elite",
  "Terminator",
  "Korhne Bezerker",
  "Thousand Son"

]

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

create_weapon_options = (opts = {}) ->
    opts.troops.empty()
    weaponoptions = ""
    $.each opts.weapons, (i) ->
      weaponoptions += "<option value=\"" + opts.weapons[i] + "\">" + opts.weapons[i] + "</option>"
    opts.troops.append weaponoptions

create_landraider = (opts = {}) -> #TODO
  $(".squad_wrap").show()
  # _.times(2, -> generateTroop(troop: opts.troop))
  create_weapon_options(weapons: landRaiderMain, troops: opts.location.find('.army_squads_troops_weapon select'))
  gun = opts.location.closest(".squad").find('.army_squads_troops_weapon select').clone(true)
  gun2 = opts.location.closest(".squad").find('.army_squads_troops_weapon select').clone(true)

  squad = opts.location.find("table tr td")
  squad.prepend(gun)
  squad.prepend(gun2)
  console.log opts.location.closest(".squad").find("select")

  # create_weapon_options(weapons: landRaiderSide, troops: opts.location.find(" table tr:nth-child(2)").find(".army_squads_troops_weapon select"))

  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "landraider"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  opts.location.closest(".squad").find("table").addClass "tank"

create_default_cultist_squad = (opts = {}) ->
  $(".squad_wrap").show()
  _.times(9, -> generateTroop(troop: opts.troop))
  create_weapon_options(weapons: cultistWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  SquadPoints = 50
  opts.location.find(".squadpoints").text(SquadPoints)


create_default_marine_squad = (opts = {}) ->
  $(".squad_wrap").show()
  _.times(4, -> generateTroop(troop: opts.troop))
  create_weapon_options(weapons: basicMarineWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  create_weapon_options(weapons: gunnerWeapons, troops: opts.location.find(" table tr:nth-child(2)").find(".army_squads_troops_weapon select"))
  create_weapon_options(weapons: basicMarineLeaderWeapons, troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select"))
  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "champion"
  opts.location.find(" table tr:nth-child(2)").find(".troop_icon").addClass "gunney"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  opts.location.find(" table tr:gt(2)").each ->
    $(this).find(".troop_icon").addClass "choasmarine"
  SquadPoints = 75
  opts.location.find(".squadpoints").text(SquadPoints)

create_default_havoc_squad = (opts = {}) ->
  $(".squad_wrap").show()
  _.times(4, -> generateTroop(troop: opts.troop))
  create_weapon_options(weapons: havocWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  create_weapon_options(weapons: basicMarineLeaderWeapons, troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select"))
  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "champion"
  opts.location.find(" table tr:gt(1)").each ->
    $(this).find(".troop_icon").addClass "havoc"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  SquadPoints = 75
  opts.location.find(".squadpoints").text(SquadPoints)

create_default_thousand_son_marine_squad = (opts = {}) ->
  $(".squad_wrap").show()
  _.times(4, -> generateTroop(troop: opts.troop))
  create_weapon_options(weapons: thousandSonMarineWeapon, troops: opts.location.find('.army_squads_troops_weapon select'))
  create_weapon_options(weapons: thousandSonMarineWeapon, troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select"))
  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "tenkleader"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  opts.location.find(" table tr:gt(1)").each ->
    $(this).find(".troop_icon").addClass "tenk"
  SquadPoints = 150
  opts.location.find(".squadpoints").text(SquadPoints)

create_socrcerer = (opts = {}) ->
  create_weapon_options(weapons: ["Force Axe", "Boltgun"], troops: opts.location.find('.army_squads_troops_weapon select'))

find_min_squad_size = (opts = {}) ->
  return do ->
    switch opts.type
      when "Cultist" then 10
      when "Havoc", "Marine", "Thousand Son" then 5

find_max_squad_size = (opts = {}) ->
  return do ->
    switch opts.type
      when "Cultist" then 35
      when "Marine" then 20
      when "Havoc" then 10




weaponPointChart = (opts = {}) ->
  points = 0
  opts.troops.each ->
    switch $(this).val()
      when "flamer" then points += 5
      when "meltagun", "plasmagun" then points += 10
      when "plasmapistol" then points += 15
      when "cannon" then points += 20
  return do ->
    points

squadDetails = (opts = {}) ->
  squad =
    min: 0
    max: 0
    troop: 0
    base: 0
    havoc: 0
    gunny: 0
    basicWeapons: []
    gunnyWeapons: []
    havocWeapons: []

  switch opts.type
    when "Havoc"
      squad.min = 5
      squad.max = 10
      squad.troop = 13
      squad.base = 75
      squad.havoc = 4
      squad.basicWeapons = basicMarineWeapons
      squad.havocWeapons = havocWeapons

    when "Marine"
      squad.min = 5
      squad.max = 25
      squad.troop = 13
      squad.base = 75
      squad.havoc = 1
      squad.gunny = 1
      squad.basicWeapons = basicMarineWeapons
      squad.havocWeapons = havocWeapons
      squad.gunnyWeapons = gunnerWeapons
    when "Cultist"
      squad.min = 10
      squad.max = 35
      squad.troop = 4
      squad.base = 50
      squad.havoc = 0
      squad.gunny = 3
      squad.basicWeapons = basicMarineWeapons
      squad.havocWeapons = havocWeapons
      squad.gunnyWeapons = gunnerWeapons
  squad

countSquadPoints = (opts = {}) ->
  squadPoints = 0
  squad = squadDetails(type: opts.type)
  squadPoints += squad.base
  surplusTroops = opts.size - squad.min if surplusTroops isnt 0
  squadPoints += surplusTroops * squad.troop if surplusTroops isnt 0
  weaponPoints = weaponPointChart(troops: opts.troops)
  squadPoints += weaponPoints
  opts.table.find(".squadpoints").text(squadPoints)

addTroopRules = (opts = {}) ->
  table = opts.troop.closest(".squad")
  max = find_max_squad_size(type: opts.type)
  squadFull = (max - opts.size)
  if squadFull isnt 0
    generateTroop
      troop: opts.troop
    size = opts.size + 1 if opts.type is "Marine"
    #TODO
    if opts.type is "havoc"
      table.find(" table tr:nth-child(6)").find(".troop_icon").removeClass "havoc"
      table.find(" table tr:nth-child(6)").find(".troop_icon").addClass "choasmarine"
      create_weapon_options(weapons: basicMarineWeapons, troops: table.find(" table tr:nth-child(6)").find(".army_squads_troops_weapon select"))
    if size is 10 and opts.type is "Marine"
      create_weapon_options(weapons: havocWeapons, troops: table.find(" table tr:nth-child(3)").find(".army_squads_troops_weapon select"))
      table.find(" table tr:nth-child(3)").find(".troop_icon").removeClass "choasmarine"
      table.find(" table tr:nth-child(3)").find(".troop_icon").addClass "havoc"

  if squadFull is 1
    table.find(".add_troop").hide()

  min = find_min_squad_size(type: opts.type)
  extratroops = table.find(" table tr:gt(#{min})")
  extratroops.each ->
    $(this).find("a.remove_troop").show()


addSpecialTroopToSquad = (opts = {}) ->
    create_weapon_options(weapons: opts.specialWeapons, troops: table.find(" table tr:nth-child(#{opts.child})").find(".army_squads_troops_weapon select"))
    table.find(" table tr:nth-child(#{opts.child})").find(".troop_icon").addClass "#{opts.typeImage}"

weaponRules = (opts = {}) ->
  table = opts.location

  if opts.size < 10 and opts.type is "Marine"
    create_weapon_options(weapons: basicMarineWeapons, troops: table.find(" table tr:nth-child(3)").find(".army_squads_troops_weapon select"))
    table.find(" table tr:nth-child(3)").find(".troop_icon").addClass "choasmarine"
  countSquadPoints(troops: opts.troops, table: table, size: opts.size, type: opts.type)
  countArmyPoints ->

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


armyRules = ->
  heavy = 0
  troop = 0
  elite = 0
  hq = 0
  $(".squad").find("h4").each ->
    switch $(this).text()
      when "Heavy" then heavy += 1
      when "Troops" then troop += 1
      when "Elite" then elite += 1
      when "HQ" then hq += 1
  if elite >= 3
    $("#add_elite").hide()
  if elite < 3
    $("#add_elite").show()
  if heavy >= 3
    $("#add_heavyweapon").hide()
  if heavy < 3
    $("#add_heavyweapon").show()
  if hq >= 2
    $("#add_hq").hide()
  else
    $("#add_hq").show()
  countArmyPoints ->

createNewTable = (opts = {}) ->
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
  squad.before squadClone unless opts.hidden is true
  squad.after squadClone if opts.hidden is true
  squadClone.hide() if opts.hidden is true
  $(".fields.squad:last").prev().find(".remove_troop").hide()

# Creat mandatory Choas Army squads
#
set_up_choas_army = ->
  $(".squadform").show()
  $("h2").prepend("<img id='choasarmy' src='/assets/choas/choasarmy.jpeg'/>")
  $(".army_squads_name select").empty()
  troopsOptions = ""
  $.each choasTroops, (i) ->
    troopsOptions += "<option value=\"" + choasTroops[i] + "\">" + choasTroops[i] + "</option>"
  $(".army_squads_name select").append troopsOptions
  createNewTable ->
  createNewTable ->
  $(".squad").find("a.remove_squad").hide()
  $(".squad:last").find("a.remove_squad").show()
  findSquad = $(".squad:last").prev()
  hqSquads = findSquad.find('.army_squads_name select')
  hqSquads.empty()
  hqOptions = ""
  $.each choasHQ, (i) ->
    hqOptions += "<option value=\"" + choasHQ[i] + "\">" + choasHQ[i] + "</option>"
  hqSquads.append hqOptions
  findSquad.find("h4").text("HQ")
  findSquad.find(".add_troop").hide()

countArmyPoints = ->
  allSquadPoints = $(".squad").find(".squadpoints")
  points = 0
  allSquadPoints.each ->
    points += parseInt($(this).text()) if parseInt($(this).text()) > 0
  $(".army_points").text(points)

editTableWithProperOptions = (opts = {}) ->
  findSquad = $(".squad:last").prev()
  squadTable = findSquad.find('.army_squads_name select')
  squadTable.empty()
  options = ""
  $.each opts.type, (i) ->
    options += "<option value=\"" + opts.type[i] + "\">" + opts.type[i] + "</option>"
  squadTable.append options
  findSquad.find("h4").text(opts.title)
  findSquad.find(".add_troop").hide() if opts.title is "HQ"
  armyRules ->

jQuery ->

  hideObjects = do ->
    $(".squadform").hide()

  createSquadFieldThatWillRemainHidden = do ->
    createNewTable(hidden: true)

  $(".army_faction select").change ->
    if $(this).val() is "Choas Force"
      set_up_choas_army ->

  $("#add_squad").click ->
    event.preventDefault()
    createNewTable ->
    armyRules ->

  $("#add_hq").click ->
    event.preventDefault()
    createNewTable ->
    editTableWithProperOptions(type: choasHQ, title: "HQ")

  $("#add_elite").click ->
    event.preventDefault()
    createNewTable ->
    editTableWithProperOptions(type: choasEliteSquads, title: "Elite")

  $("#add_heavyweapon").click ->
    event.preventDefault()
    createNewTable ->
    editTableWithProperOptions(type: choasHeavyWeapon, title: "Heavy")

  $(".remove_squad").click ->
    event.preventDefault()
    $(this).closest(".squad").remove()
    armyRules ->

  $(".remove_troop").click ->
    event.preventDefault()
    location = $(this).closest(".squad")
    squad = getSquadInfo(location)
    $(this).closest("tr").remove()
    squad = getSquadInfo(location)
    weaponRules(troops: squad.troops, size: squad.size, location: location, type: squad.type)
    max = find_max_squad_size(type: squad.type)
    squadFull = (max - squad.size)
    if squadFull is 0
      location.find(".add_troop").hide()
    else
      location.find(".add_troop").show()

  $(".add_troop").click ->
    event.preventDefault()
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    addTroopRules(size: squad.size, troop: squad.troop, type: squad.type)
    newSquad = getSquadInfo(currentSquad)
    weaponRules(troops: newSquad.troops, size: newSquad.size, location: currentSquad, type: newSquad.type)

  $(".army_squads_troops_weapon select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    weaponRules(troops: squad.troops, size: squad.size, location: currentSquad, type: squad.type)

  $(".army_squads_name select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    while squad.size > 1  # reset troops in squad for when squad changes types
      $(this).closest(".squad").find("table tbody tr:last").remove()
      squad.size--
    # currentSquad.find(" table tr:nth-child(1)").find(".info").find("img").remove() # clean all countMarineWeaponPoints
    squad = getSquadInfo(currentSquad)
    info = (troop: squad.troop, location: currentSquad)
    switch squad.type
      when "Marine" then create_default_marine_squad info
      when "Havoc"  then create_default_havoc_squad info
      when "Cultist"  then create_default_cultist_squad info
      when "Thousand Son" then create_default_thousand_son_marine_squad info
      when "LandRaider" then create_landraider info
      when "Sorcerer" then create_socrcerer info
    countArmyPoints ->

  $("#click").click ->
