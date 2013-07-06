
basicOrkWeapons = [
  "slugga"
  "choppa"
]


HQ = [
  "Select Character",
  "WarBoss",
  "Zogwort",
  "Weirdboy"
]

gretchinWeapons = [
  "blasta"
]

Troops = [
  "Select Troop"
  "Ork",
  "Gretchin",
]

heavySupport = [
  "Select Heavy"
  "Big Gunz"
  "BattleWagon"
  "Looted Wagon"
]

fastAttack = [
  "Select Squad",
  "StormBoyz",
  "Ork Bike",
  "War Buggy"
]

EliteSquads = [
  "Select Elite",
  "TankBustas",
  "Lootas",
  "Kommandos"

]

squadDetails = (opts = {}) ->
  squad =
    min: 0
    max: 0
    troop: 0
    base: 0
    havoc: 0
    gunny: 0
    type: ""
    basicWeapons: []
    sideWeapon: []
    troopPic: ""
    squadPoints: 0
    size: 0
    bs: 0
    ws: 0
    s: 0
    t: 0
    w: 0
    i: 0
    a: 0
    ld: 0
    sv: 0

  switch opts.type

    when "Ork"
      squad.min = 10
      squad.max = 30
      squad.troop = 6
      squad.base = 60
      squad.basicWeapons = basicOrkWeapons
      squad.type = "Troop"
      squad.sideWeapons = ["club"]
      squad.squadPoints = 60
      squad.troopPic = "ork"
      squad.type = "Troop"
      squad.size = 10
      squad.bs = 2
      squad.ws = 4
      squad.s =  3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 2
      squad.ld = 7
      squad.sv = 6

    when "Gretchin"
      squad.min = 10
      squad.max = 35
      squad.troop = 3
      squad.base = 50
      squad.gunny = 3
      squad.basicWeapons = gretchinWeapons
      squad.stats = [4, 4, 4, 4, 4, 1, 9, 3]
      squad.sideWeapons = ["club"]
      squad.squadPoints = 60
      squad.troopPic = "ork"
      squad.type = "Troop"
      squad.size = 10
      squad.bs = 2
      squad.ws = 4
      squad.s = 3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 2
      squad.ld = 5
      squad.sv = 6
    when "StormBoyz"
      squad.min = 5
      squad.max = 20
      squad.troop = 12
      squad.base = 60
      squad.basicWeapons = basicOrkWeapons
      squad.type = "Fast"
      squad.sideWeapons = ["club"]
      squad.squadPoints = 60
      squad.troopPic = "ork"
      squad.size = 5
      squad.bs = 2
      squad.ws = 4
      squad.s =  3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 7
      squad.sv = 6

    when "TankBustas"
      squad.min = 5
      squad.max = 15
      squad.troop = 15
      squad.base = 75
      squad.basicWeapons = ["Rokkit"]
      squad.type = "Elite"
      squad.sideWeapons = ["club"]
      squad.squadPoints = 75
      squad.troopPic = "ork"
      squad.size = 5
      squad.bs = 2
      squad.ws = 4
      squad.s =  3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 7
      squad.sv = 6
    when "Kommandos"
      squad.min = 5
      squad.max = 15
      squad.troop = 15
      squad.base = 75
      squad.basicWeapons = ["BigShota"]
      squad.type = "Elite"
      squad.sideWeapons = ["club"]
      squad.squadPoints = 75
      squad.troopPic = "ork"
      squad.size = 5
      squad.bs = 2
      squad.ws = 4
      squad.s =  3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 7
      squad.sv = 6
    when "Lootas"
      squad.min = 5
      squad.max = 15
      squad.troop = 15
      squad.base = 75
      squad.basicWeapons = ["Defgun"]
      squad.type = "Elite"
      squad.sideWeapons = ["club"]
      squad.squadPoints = 75
      squad.troopPic = "ork"
      squad.size = 5
      squad.bs = 2
      squad.ws = 4
      squad.s =  3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 7
      squad.sv = 6

  squad

renameField = (opts = {}) ->
  opts.field.attr('name', opts.field.attr('name').replace(opts.matcher, opts.number))
  opts.field.attr('id', opts.field.attr('id').replace(opts.matcher, opts.number))

generateTroop = (opts = {}) ->
  troopClone = opts.troop.clone(true)
  number = _.random(0, 100000)
  renameField
    number: number
    matcher: /(\d+)(?!.*\d)/
    field: troopClone.find('.army_squads_troops_weapon select')
  renameField
    number: number
    matcher: /(\d+)(?!.*\d)/
    field: troopClone.find('.army_squads_troops_side_weapon select')
  opts.troop.after troopClone

createWeaponOptions = (opts = {}) ->
    opts.troops.empty()
    weaponoptions = ""
    $.each opts.weapons, (i) ->
      weaponoptions += "<option value=\"" + opts.weapons[i] + "\">" + opts.weapons[i] + "</option>"
    opts.troops.append weaponoptions

#Squad Creators

createDefaultSquad = (opts = {}) ->
  squad = squadDetails(type: opts.type)
  opts.location.find(".squad_wrap").show()
  baseSize = squad.min - 1
  _.times(baseSize, -> generateTroop(troop: opts.troop))
  createWeaponOptions(weapons: squad.basicWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  createWeaponOptions(weapons: squad.sideWeapons, troops: opts.location.find('.army_squads_troops_side_weapon select'))
  opts.location.find(".squadtype").text(opts.type)

  opts.location.find(" table tr:gt(2)").each ->
    $(this).find(".troop_icon").addClass squad.troopPic
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()

  opts.location.find(".squadpoints").text(opts.squadPoints)
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find(".troop_stat").find("tr:last").find("td:eq(0)").text("#{squad.bs}")
    $(this).find(".troop_stat").find("tr:last").find("td:eq(1)").text("#{squad.ws}")
    $(this).find(".troop_stat").find("tr:last").find("td:eq(2)").text("#{squad.s}")
    $(this).find(".troop_stat").find("tr:last").find("td:eq(3)").text("#{squad.t}")
    $(this).find(".troop_stat").find("tr:last").find("td:eq(4)").text("#{squad.w}")
    $(this).find(".troop_stat").find("tr:last").find("td:eq(5)").text("#{squad.i}")
    $(this).find(".troop_stat").find("tr:last").find("td:eq(6)").text("#{squad.a}")
    $(this).find(".troop_stat").find("tr:last").find("td:eq(7)").text("#{squad.ld}")
    $(this).find(".troop_stat").find("tr:last").find("td:eq(8)").text("#{squad.sv}")
  opts.location.find(".squadpoints").text(squad.base)
  opts.location.find(".squadsize").text(squad.size)

weaponPointChart = (opts = {}) ->
  points = 0
  opts.troops.each ->
    switch $(this).val()
      when "autogun" then points += 1
      when "shotgun" then points += 2
      when "chainaxe", "combibolter", "sonicblaster" then points += 3
      when "flamer", "heavystubber", "meltabomb" then points += 5
      when "meltagun", "heavybotler", "autocannon" then points += 10
      when "plasmapistol", "plasmagun", "misssle launcher", "doomsiren", "powerweapon" then points += 15
      when "lascannon" then points += 20
      when "powerfist" then points += 25
      when "blastmaster" then points += 30
  return do ->
    points

countSquadPoints = (opts = {}) ->

  squadPoints = 0
  squad = squadDetails(type: opts.type)
  squadPoints += squad.base
  surplusTroops = opts.size - squad.min if surplusTroops isnt 0
  squadPoints += surplusTroops * squad.troop if surplusTroops isnt 0
  weaponPoints = weaponPointChart(troops: opts.troops)
  weaponPoints += weaponPointChart(troops: opts.sideWeapon)
  squadPoints += weaponPoints
  opts.table.find(".squadsize").text(opts.size)
  opts.table.find(".squadpoints").text(squadPoints)

countArmyPoints = ->
  allSquadPoints = $(".squad").find(".squadpoints")
  points = 0
  allSquadPoints.each ->
    points += parseInt($(this).text()) if parseInt($(this).text()) > 0
  $(".army_points").text(points)


#Squad Helpers
#
changeTroopTypeInSquad = (opts = {}) ->
  table = opts.table
  createWeaponOptions(weapons: opts.specialWeapons, troops: table.find(" table tr:nth-child(#{opts.child})").find(".army_squads_troops_weapon select"))
  table.find(" table tr:nth-child(#{opts.child})").find(".troop_icon").removeClass opts.removeImage if opts.remove is true
  table.find(" table tr:nth-child(#{opts.child})").find(".troop_icon").addClass opts.image


addTroopRules = (opts = {}) ->
  table = opts.troop.closest(".squad")
  squad = squadDetails(type: opts.type)
  max = squad.max
  squadFull = (max - opts.size)
  generateTroop(troop: opts.troop)
  size = opts.size + 1
  table.find(".add_troop").hide() if squadFull is 1
  minFactor = squad.min - 1
  extratroops = table.find(" table tr.troop:gt(#{minFactor})")
  extratroops.each ->
    $(this).find("a.remove_troop").show()

removeTroopRules = (opts = {}) ->
  table = opts.location
  countSquadPoints(troops: opts.troops, table: table, size: opts.size, type: opts.type, sideWeapon: opts.sideWeapon)
  countArmyPoints ->

getSquadInfo = (squad) ->
  return do ->
    object: squad
    troops: squad.find('.army_squads_troops_weapon select')
    sideWeapon: squad.find('.army_squads_troops_side_weapon select')
    size: squad.find('.army_squads_troops_weapon').size()
    weapons: squad.find('.army_squads_troops_weapon select option')
    type: squad.find(".army_squads_name select").val()
    troop: squad.find("table tbody tr.troop:last")
    normalTroops: squad.find(" table tr:gt(1)")
    leaderTroop: squad.find(" table tr:nth-child(1)")

createHQLeaderRules = (opts = {}) ->
  opts.squadType.each ->
    $(this).text("Troops") if $(this).closest(".squad").find(".army_squads_name select").val() is opts.squadChange and opts.add is true
    $(this).text("Elite") if $(this).closest(".squad").find(".army_squads_name select").val() is opts.squadChange and opts.remove is true

identifyHQInArmy = (opts = {}) ->
  sorcerer = 0
  kharn = 0
  squadType = opts.squadType
  squadType.each ->
    hqType = $(this).closest(".squad").find(".army_squads_name select").val()
    if hqType is "Sorcerer"
      sorcerer += 1
      createHQLeaderRules(squadType: squadType, squadChange: "Thousand Son", add: true)
    if sorcerer is 0
      createHQLeaderRules(squadType: squadType, squadChange: "Thousand Son", remove: true)
    if hqType is "Kharn"
      kharn += 1
      createHQLeaderRules(squadType: squadType, squadChange: "Berzerker", add: true)
    if kharn is 0
      createHQLeaderRules(squadType: squadType, squadChange: "Berzerker", remove: true)

armyRules = ->
  troop = 0
  heavy = 0
  troop = -1
  elite = 0
  fast = 0
  hq = 0
  squadType = $(".squad").find(".squadtype")
  identifyHQInArmy(squadType: squadType)
  squadType.each ->
    switch $(this).text()
      when "Heavy" then heavy += 1
      when "Troops" then troop += 1
      when "Elite" then elite += 1
      when "Fast Attack" then fast += 1
      when "HQ" then hq += 1
  armyCompositionTable = $(".army_list")
  armyCompositionTable.find(".hq").text(hq)
  armyCompositionTable.find(".fast").text(fast)
  armyCompositionTable.find(".troop").text(troop)
  armyCompositionTable.find(".heavy").text(heavy)
  armyCompositionTable.find(".elite").text(elite)

  if elite >= 3
    $("#add_elite").hide()
  if elite < 3
    $("#add_elite").show()
  if heavy >= 3
    $("#add_heavyweapon").hide()
  if heavy < 3
    $("#add_heavyweapon").show()
  if fast >= 3
    $("#add_fastattack").hide()
  if fast < 3
    $("#add_fastattack").show()
  if hq >= 2
    $("#add_hq").hide()
  else
    $("#add_hq").show()
  if troop >= 6
    $("#add_squad").hide()
  else
    $("#add_squad").show()
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
  renameField
    field: squadClone.find('.army_squads_troops_side_weapon select')
    number: newNumber
    matcher: squadMatcher

  squad.before squadClone unless opts.hidden is true
  squad.after squadClone if opts.hidden is true
  squadClone.hide() if opts.hidden is true
  $(".fields.squad:last").prev().find(".remove_troop").hide()

# Creat mandatory Choas Army squads
#
setUpArmy = ->
  $(".squadform").show()
  $(".army_squads_name select").empty()
  troopsOptions = ""
  $.each Troops, (i) ->
    troopsOptions += "<option value=\"" + Troops[i] + "\">" + Troops[i] + "</option>"
  $(".army_squads_name select").append troopsOptions
  createNewTable ->
  createNewTable ->
  $(".squad").find("a.remove_squad").hide()
  $(".squad:last").find("a.remove_squad").show()
  findSquad = $(".squad:last").prev()
  hqSquads = findSquad.find('.army_squads_name select')
  hqSquads.empty()
  hqOptions = ""
  $.each HQ, (i) ->
    hqOptions += "<option value=\"" + HQ[i] + "\">" + HQ[i] + "</option>"
  hqSquads.append hqOptions
  $(".squad").find(".squad_wrap").hide()
  findSquad.find(".squadtype").text("HQ")
  findSquad.find(".add_troop").hide()

editTableWithProperOptions = (opts = {}) ->
  findSquad = $(".squad:last").prev()
  squadTable = findSquad.find('.army_squads_name select')
  squadTable.empty()
  options = ""
  $.each opts.type, (i) ->
    options += "<option value=\"" + opts.type[i] + "\">" + opts.type[i] + "</option>"
  squadTable.append options
  findSquad.find(".squadtype").text(opts.title)
  findSquad.find(".add_troop").hide() if opts.title is "HQ"
  armyRules ->


jQuery ->

  createSquadFieldThatWillRemainHidden = do ->
    createNewTable(hidden: true)

  setArmyForChoas = do -> #TODO FIX This
    setUpArmy ->

  $("#add_squad").click ->
    event.preventDefault()
    createNewTable ->
    armyRules ->

  $("#add_hq").click ->
    event.preventDefault()
    createNewTable ->
    editTableWithProperOptions(type: HQ, title: "HQ")

  $("#add_elite").click ->
    event.preventDefault()
    createNewTable ->
    editTableWithProperOptions(type: EliteSquads, title: "Elite")

  $("#add_heavyweapon").click ->
    event.preventDefault()
    createNewTable ->
    editTableWithProperOptions(type: heavySupport, title: "Heavy")

  $("#add_fastattack").click ->
    event.preventDefault()
    createNewTable ->
    editTableWithProperOptions(type: fastAttack, title: "Fast Attack")

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
    removeTroopRules(troops: squad.troops, size: squad.size, location: location, type: squad.type, sideWeapon: squad.sideWeapon, squadMark: squad.squadMark)
    location.find(".add_troop").show()

  $(".add_troop").click ->
    event.preventDefault()
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    addTroopRules(size: squad.size, troop: squad.troop, type: squad.type)
    newSquad = getSquadInfo(currentSquad)
    countSquadPoints(troops: newSquad.troops, table: currentSquad, size: newSquad.size, type: newSquad.type, sideWeapon: newSquad.sideWeapon, squadMark: newSquad.squadMark)

  $(".army_squads_troops_weapon select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    countSquadPoints(troops: squad.troops, table: currentSquad, size: squad.size, type: squad.type, sideWeapon: squad.sideWeapon, squadMark: squad.squadMark)

  $(".army_squads_troops_side_weapon select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    countSquadPoints(troops: squad.troops, table: currentSquad, size: squad.size, type: squad.type, sideWeapon: squad.sideWeapon)

  $(".army_squads_name select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    while squad.size > 1  # reset troops in squad for when squad changes types
      $(this).closest(".squad").find("table tbody tr.troop:last").remove()
      squad.size--
    squad = getSquadInfo(currentSquad)
    info = (troop: squad.troop, location: currentSquad, type: squad.type)
    createDefaultSquad info
    armyRules ->
    countArmyPoints ->

