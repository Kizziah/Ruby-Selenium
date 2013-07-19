
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

Troop = [
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
    front: 0
    rear: 0
    side: 0
    hp: 0

  switch opts.type

    when "Ork"
      squad.min = 10
      squad.max = 30
      squad.troop = 6
      squad.base = 60
      squad.basicWeapons = basicOrkWeapons
      squad.type = "Troop"
      squad.sideWeapons = ["club"]
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

    when "Ork Bike"
      squad.min = 3
      squad.max = 12
      squad.troop = 25
      squad.base = 75
      squad.basicWeapons = ["Defgun"]
      squad.type = "Fast"
      squad.sideWeapons = ["club"]
      squad.troopPic = "ork"
      squad.size = 3
      squad.bs = 2
      squad.ws = 4
      squad.s =  3
      squad.t = 5
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 7
      squad.sv = 4
    when "Deffkoptas"
      squad.min = 2
      squad.max = 5
      squad.troop = 35
      squad.base = 70
      squad.basicWeapons = ["Defgun"]
      squad.type = "Fast"
      squad.sideWeapons = ["club"]
      squad.troopPic = "ork"
      squad.size = 3
      squad.bs = 2
      squad.ws = 4
      squad.s =  3
      squad.t = 5
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 7
      squad.sv = 4

    when "WarBoss"
      squad.min = 1
      squad.max = 1
      squad.troop = 185
      squad.base = 185
      squad.basicWeapons = ["Defgun"]
      squad.type = "HQ"
      squad.sideWeapons = ["club"]
      squad.troopPic = "ork"
      squad.size = 5
      squad.bs = 2
      squad.ws = 6
      squad.s =  3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 10
      squad.sv = 6
    when "Weirdboy"
      squad.min = 1
      squad.max = 1
      squad.troop = 120
      squad.base = 120
      squad.basicWeapons = ["Defgun"]
      squad.type = "HQ"
      squad.sideWeapons = ["club"]
      squad.troopPic = "ork"
      squad.size = 5
      squad.bs = 3
      squad.ws = 5
      squad.s =  3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 8
      squad.sv = 6
    when "Zogwort"
      squad.min = 1
      squad.max = 1
      squad.troop = 185
      squad.base = 185
      squad.basicWeapons = ["Defgun"]
      squad.type = "HQ"
      squad.sideWeapons = ["club"]
      squad.troopPic = "ork"
      squad.size = 5
      squad.bs = 2
      squad.ws = 6
      squad.s =  3
      squad.t = 4
      squad.w = 1
      squad.i = 2
      squad.a = 3
      squad.ld = 9
      squad.sv = 6

    when "Big Gunz"
      squad.min = 1
      squad.max = 1
      squad.troop = 90
      squad.base = 90
      squad.basicWeapons = ["cannon"]
      squad.type = "Heavy"
      squad.sideWeapons = ["blasta"]
      squad.troopPic = "ork"
      squad.size = 1
      squad.front = 12
      squad.side = 10
      squad.rear = 10
      squad.hp = 2
      squad.bs = 3

    when "BattleWagon"
      squad.min = 1
      squad.max = 1
      squad.troop = 150
      squad.base = 150
      squad.basicWeapons = ["cannon"]
      squad.type = "Heavy"
      squad.sideWeapons = ["blasta"]
      squad.troopPic = "ork"
      squad.size = 1
      squad.bs = 3
      squad.front = 14
      squad.side = 12
      squad.rear = 12
      squad.hp = 4
    when "Looted Wagon"
      squad.min = 1
      squad.max = 1
      squad.troop = 120
      squad.base = 120
      squad.basicWeapons = ["cannon"]
      squad.type = "Heavy"
      squad.sideWeapons = ["blasta"]
      squad.troopPic = "ork"
      squad.size = 1
      squad.front = 12
      squad.side = 12
      squad.rear = 12
      squad.hp = 3
      squad.bs = 3

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
createDefaultVechicle = (opts = {}) ->
  squad = squadDetails(type: opts.type)
  opts.location.find(".squad_wrap").show()
  baseSize = squad.min - 1
  _.times(baseSize, -> generateTroop(troop: opts.troop))
  createWeaponOptions(weapons: squad.basicWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  createWeaponOptions(weapons: squad.sideWeapons, troops: opts.location.find('.army_squads_troops_side_weapon select'))
  opts.location.find(".squadtype").text(squad.type)

  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  opts.location.find(".squadpoints").text(squad.base)
  opts.location.find(".squadsize").text(squad.size)
  if opts.location.find("table.troop_stat tr:first td").size() > 7
    opts.location.find("table.troop_stat tr:first").find("td:eq(2)").text("F")
    opts.location.find("table.troop_stat tr:first").find("td:eq(3)").text("S")
    opts.location.find("table.troop_stat tr:first").find("td:eq(4)").text("R")
    opts.location.find("table.troop_stat tr:first").find("td:eq(5)").text("HP")
    opts.location.find("table.troop_stat tr:last").find("td:eq(0)").text("#{squad.bs}")
    opts.location.find("table.troop_stat tr:last").find("td:eq(1)").text("#{squad.front}")
    opts.location.find("table.troop_stat tr:last").find("td:eq(2)").text("#{squad.side}")
    opts.location.find("table.troop_stat tr:last").find("td:eq(3)").text("#{squad.rear}")
    opts.location.find("table.troop_stat tr:last").find("td:eq(4)").text("#{squad.hp}")
    opts.location.find("table.troop_stat tr:first").find("td:eq(0)").remove()
    opts.location.find("table.troop_stat tr:first").find("td:eq(5)").remove()
    opts.location.find("table.troop_stat tr:first").find("td:eq(5)").remove()
    opts.location.find("table.troop_stat tr:first").find("td:eq(5)").remove()
    opts.location.find("table.troop_stat tr:first").find("td:eq(5)").remove()
    opts.location.find("table.troop_stat tr:first").find("td:eq(5)").remove()
    opts.location.find("table.troop_stat tr:last").find("td:eq(5)").remove()
    opts.location.find("table.troop_stat tr:last").find("td:eq(5)").remove()
    opts.location.find("table.troop_stat tr:last").find("td:eq(5)").remove()
    opts.location.find("table.troop_stat tr:last").find("td:eq(5)").remove()
  else
    opts.location.find("table.troop_stat tr:last").find("td:eq(0)").text("#{squad.bs}")
    opts.location.find("table.troop_stat tr:last").find("td:eq(1)").text("#{squad.front}")
    opts.location.find("table.troop_stat tr:last").find("td:eq(2)").text("#{squad.side}")
    opts.location.find("table.troop_stat tr:last").find("td:eq(3)").text("#{squad.rear}")
    opts.location.find("table.troop_stat tr:last").find("td:eq(4)").text("#{squad.hp}")

createDefaultSquad = (opts = {}) ->
  squad = squadDetails(type: opts.type)
  opts.location.find(".squad_wrap").show()
  baseSize = squad.min - 1
  _.times(baseSize, -> generateTroop(troop: opts.troop))
  createWeaponOptions(weapons: squad.basicWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  createWeaponOptions(weapons: squad.sideWeapons, troops: opts.location.find('.army_squads_troops_side_weapon select'))
  opts.location.find(".squadtype").text(squad.type)

  opts.location.find(" table tr:gt(2)").each ->
    $(this).find(".troop_icon").addClass squad.troopPic
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()

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

armyRules = ->
  troop = 0
  heavy = 0
  elite = 0
  fast = 0
  hq = 0

  heavypoints = 0
  trooppoints = 0
  elitepoints = 0
  fastpoints = 0
  hqpoints = 0
  squadType = $(".squad").find(".squadtype")
  squadType.each ->
    switch $(this).text()
      when "Heavy" then heavy += 1
      when "Troop" then troop += 1
      when "Elite" then elite += 1
      when "HQ" then hq += 1
      when "Fast Attack" then fast += 1

  totalsquadpoints = $(".squad").find(".squadpoints")
  allSquads = $(".squad")
  allSquads.each ->
    switch $(this).find(".squadtype").text()
      when "Troop" then trooppoints = parseInt($(this).find(".squadpoints").text()) + trooppoints if $.isNumeric(parseInt($(this).find(".squadpoints").text())) is true
      when "Heavy" then heavypoints = parseInt($(this).find(".squadpoints").text()) + heavypoints if $.isNumeric(parseInt($(this).find(".squadpoints").text())) is true
      when "Elite" then elitepoints = parseInt($(this).find(".squadpoints").text()) + elitepoints if $.isNumeric(parseInt($(this).find(".squadpoints").text())) is true
      when "Fast" then fastpoints = parseInt($(this).find(".squadpoints").text()) + fastpoints if $.isNumeric(parseInt($(this).find(".squadpoints").text())) is true
      when "HQ" then hqpoints = parseInt($(this).find(".squadpoints").text()) + hqpoints if $.isNumeric(parseInt($(this).find(".squadpoints").text())) is true

  armyCompositionTable = $(".army_list")
  armyCompositionTable.find(".hq").text(hq)
  armyCompositionTable.find(".fast").text(fast)
  armyCompositionTable.find(".troop").text(troop)
  armyCompositionTable.find(".heavy").text(heavy)
  armyCompositionTable.find(".elite").text(elite)
  armyCompositionTable.find(".fastpoints").text(fastpoints)
  armyCompositionTable.find(".trooppoints").text(trooppoints)
  armyCompositionTable.find(".heavypoints").text(heavypoints)
  armyCompositionTable.find(".elitepoints").text(elitepoints)
  armyCompositionTable.find(".hqpoints").text(hqpoints)

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
  opts.table.find('.army_squads_points input').hide()
  opts.table.find('.army_squads_points input').val(squadPoints)
  armyRules ->

countArmyPoints = ->
  allSquadPoints = $(".squad").find(".squadpoints")
  points = 0
  allSquadPoints.each ->
    points += parseInt($(this).text()) if parseInt($(this).text()) > 0
  $(".army_points").text(points)
  $(".army_list").find("tr:last").find("td:eq(2)").text(points)
  progressBar = $(".progressbar").find(".bar")
  bar = points / 2000
  bar = bar * 100

  progressBar.css('width', "#{bar}%")
  bar = parseInt(bar)
  $(".barpoints").text("#{bar}%")

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
  renameField
    field: squadClone.find('.army_squads_points input')
    number: newNumber
    matcher: squadMatcher
  squad.before squadClone unless opts.hidden is true
  squad.after squadClone if opts.hidden is true
  squadClone.hide() if opts.hidden is true
  $(".fields.squad:last").prev().find(".remove_troop").hide()

setUpArmy = ->
  $(".squadform").show()
  $(".army_squads_name select").empty()
  troopsOptions = ""
  $.each Troop, (i) ->
    troopsOptions += "<option value=\"" + Troop[i] + "\">" + Troop[i] + "</option>"
  $(".army_squads_name select").append troopsOptions
  createNewTable ->
  createNewTable ->
  $(".squad:first").find(".squadtype").text("Troop")
  $(".squad:first").next().find(".squadtype").text("Troop")
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
  armyRules ->

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
  if $("h1").text() is "Ork"
    $("#army_faction").val("Ork") 
    $(".faction").hide()
    createSquadFieldThatWillRemainHidden = do ->
      createNewTable(hidden: true)

    setArmy = do -> #TODO FIX This
      setUpArmy ->

    $("#add_squad").click (event) ->
      event.preventDefault()
      createNewTable ->
      editTableWithProperOptions(type: Troop, title: "Troop")
      # armyRules ->

    $("#add_hq").click (event) ->
      event.preventDefault()
      createNewTable ->
      editTableWithProperOptions(type: HQ, title: "HQ")

    $("#add_elite").click (event) ->
      event.preventDefault()
      createNewTable ->
      editTableWithProperOptions(type: EliteSquads, title: "Elite")

    $("#add_heavyweapon").click (event) ->
      event.preventDefault()
      createNewTable ->
      editTableWithProperOptions(type: heavySupport, title: "Heavy")

    $("#add_fastattack").click (event) ->
      event.preventDefault()
      createNewTable ->
      editTableWithProperOptions(type: fastAttack, title: "Fast Attack")

    $(".remove_squad").click (event) ->
      event.preventDefault()
      $(this).closest(".squad").remove()
      armyRules ->
      countArmyPoints ->

    $(".remove_troop").click (event) ->
      event.preventDefault()
      location = $(this).closest(".squad")
      squad = getSquadInfo(location)
      $(this).closest("tr").remove()
      squad = getSquadInfo(location)
      removeTroopRules(troops: squad.troops, size: squad.size, location: location, type: squad.type, sideWeapon: squad.sideWeapon, squadMark: squad.squadMark)
      location.find(".add_troop").show()
      countArmyPoints ->

    $(".add_troop").click (event) ->
      event.preventDefault()
      currentSquad = $(this).closest(".squad")
      squad = getSquadInfo(currentSquad)
      addTroopRules(size: squad.size, troop: squad.troop, type: squad.type)
      newSquad = getSquadInfo(currentSquad)
      countSquadPoints(troops: newSquad.troops, table: currentSquad, size: newSquad.size, type: newSquad.type, sideWeapon: newSquad.sideWeapon, squadMark: newSquad.squadMark)
      countArmyPoints ->

    $(".army_squads_troops_weapon select").change ->
      currentSquad = $(this).closest(".squad")
      squad = getSquadInfo(currentSquad)
      countSquadPoints(troops: squad.troops, table: currentSquad, size: squad.size, type: squad.type, sideWeapon: squad.sideWeapon, squadMark: squad.squadMark)
      countArmyPoints ->

    $(".army_squads_troops_side_weapon select").change ->
      currentSquad = $(this).closest(".squad")
      squad = getSquadInfo(currentSquad)
      countSquadPoints(troops: squad.troops, table: currentSquad, size: squad.size, type: squad.type, sideWeapon: squad.sideWeapon)
      countArmyPoints ->

    $(".army_squads_name select").change ->
      currentSquad = $(this).closest(".squad")
      squad = getSquadInfo(currentSquad)
      while squad.size > 1  # reset troops in squad for when squad changes types
        $(this).closest(".squad").find("table tbody tr.troop:last").remove()
        squad.size--
      squad = getSquadInfo(currentSquad)
      info = (troop: squad.troop, location: currentSquad, type: squad.type)
      details = squadDetails(type: squad.type)

      createDefaultSquad info unless details.type is "Heavy"
      createDefaultVechicle info if details.type is "Heavy"
      squad = getSquadInfo(currentSquad)
      countSquadPoints(troops: squad.troops, table: currentSquad, size: squad.size, type: squad.type, sideWeapon: squad.sideWeapon)
      armyRules ->
      countArmyPoints ->
