basicMarineWeapons = [
  "boltgun"
  "boltpistol"
]
gunnyWeapons = [
  "boltgun",
  "meltagun",
  "plasmagun",
  "flamer",
  "boltpistol"
]
havocWeapons = [
  "boltgun"
  "meltagun",
  "plasmagun",
  "flamer",
  "lascannon"
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

cultistGunnyWeapons = [
  "autopistol",
  "autogun",
  "flamer",
  "heavystubber"
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

choasHeavySupport = [
  "Select Heavy"
  "Havoc",
  "LandRaider"

]

choasFastAttack = [
  "Select Squad",
  "Choas Biker",
  "Raptor",
  "Choas Spawn"

]

berzerkerweapons = [
  "boltpistol"
]

landRaiderMain = [
  "lascannon",
 ]

choasEliteSquads = [
  "Select Elite",
  "Terminator",
  "Berzerker",
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

createWeaponOptions = (opts = {}) ->
    opts.troops.empty()
    weaponoptions = ""
    $.each opts.weapons, (i) ->
      weaponoptions += "<option value=\"" + opts.weapons[i] + "\">" + opts.weapons[i] + "</option>"
    opts.troops.append weaponoptions

createLandraider = (opts = {}) ->
  opts.location.find(".squad_wrap").show()
  createWeaponOptions(weapons: landRaiderMain, troops: opts.location.find('.army_squads_troops_weapon select'))
  gun = opts.location.closest(".squad").find('.army_squads_troops_weapon').clone(true)
  gun2 = opts.location.closest(".squad").find('.army_squads_troops_weapon').clone(true)
  squad = opts.location.find("table tr td")
  squad.prepend(gun)
  gunLocation = squad.prepend(gun2)
  lastGun = gunLocation.find(".input:last")
  createWeaponOptions(weapons: ["heavybolter"], troops: lastGun.find("select"))

  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "landraider"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  opts.location.closest(".squad").find("table").addClass "tank"
  SquadPoints = 230
  opts.location.find(".squadpoints").text(SquadPoints)
  opts.location.find(".add_troop").hide()

createChoasBiker = (opts = {}) ->
  _.times(2, -> generateTroop(troop: opts.troop))
  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "champion"
  opts.location.find(" table tr:nth-child(2)").find(".troop_icon").addClass "gunny"
  opts.location.find(" table tr:nth-child(3)").find(".troop_icon").addClass "gunny"
  createWeaponOptions(weapons: gunnyWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  SquadPoints = 70
  opts.location.find(".squadpoints").text(SquadPoints)


createDefaultCultistSquad = (opts = {}) ->
  opts.location.find(".squad_wrap").show()
  _.times(9, -> generateTroop(troop: opts.troop))
  createWeaponOptions(weapons: cultistWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  createWeaponOptions(weapons:  ["autopistol", "autogun", "shotgun"], troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select"))
  createWeaponOptions(weapons: cultistGunnyWeapons, troops: opts.location.find(" table tr:nth-child(2)").find(".army_squads_troops_weapon select"))
  createWeaponOptions(weapons: ["axe", "club", "mace"], troops: opts.location.find('.army_squads_troops_weapon2 select'))

  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "champion"
  opts.location.find(" table tr:nth-child(2)").find(".troop_icon").addClass "gunny"

  opts.location.find(" table tr:gt(2)").each ->
    $(this).find(".troop_icon").addClass "choasmarine"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  SquadPoints = 50
  opts.location.find(".squadpoints").text(SquadPoints)

createDefaultMarineSquad = (opts = {}) ->
  opts.location.find(".squad_wrap").show()
  _.times(4, -> generateTroop(troop: opts.troop))
  createWeaponOptions(weapons: basicMarineWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  createWeaponOptions(weapons: ["chainsword"], troops: opts.location.find('.army_squads_troops_weapon2 select'))
  createWeaponOptions(weapons: gunnyWeapons, troops: opts.location.find(" table tr:nth-child(2)").find(".army_squads_troops_weapon select"))
  createWeaponOptions(weapons: ["chainsword", "powerfist"], troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon2 select"))
  createWeaponOptions(weapons: basicMarineLeaderWeapons, troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select"))

  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "champion"
  opts.location.find(" table tr:nth-child(2)").find(".troop_icon").addClass "gunny"

  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  opts.location.find(" table tr:gt(1)").each ->
    $(this).find(".army_squads_troops_weapon2 select").hide()
  opts.location.find(" table tr:gt(2)").each ->
    $(this).find(".troop_icon").addClass "choasmarine"

  SquadPoints = 75
  opts.location.find(".squadpoints").text(SquadPoints)

createDefaultHavocSquad = (opts = {}) ->
  opts.location.find(".squad_wrap").show()

  _.times(4, -> generateTroop(troop: opts.troop))
  createWeaponOptions(weapons: havocWeapons, troops: opts.location.find('.army_squads_troops_weapon select'))
  createWeaponOptions(weapons: basicMarineLeaderWeapons, troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select"))
  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "champion"
  opts.location.find(" table tr:gt(1)").each ->
    $(this).find(".troop_icon").addClass "havoc"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  SquadPoints = 75
  opts.location.find(".squadpoints").text(SquadPoints)

createDefaultBerzerkerSquad = (opts = {}) ->
  opts.location.find(".squad_wrap").show()

  _.times(4, -> generateTroop(troop: opts.troop))
  createWeaponOptions(weapons: ["boltpistol"], troops: opts.location.find('.army_squads_troops_weapon select'))
  createWeaponOptions(weapons: ["chainsword", "chainaxe"], troops: opts.location.find('.army_squads_troops_weapon2 select'))
  createWeaponOptions(weapons: ["boltpistol"], troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select"))
  createWeaponOptions(weapons: ["boltpistol", "plasmapistol"], troops: opts.location.find(" table tr:nth-child(2)").find(".army_squads_troops_weapon select"))
  createWeaponOptions(weapons: ["boltpistol", "plasmapistol"], troops: opts.location.find(" table tr:nth-child(3)").find(".army_squads_troops_weapon select"))
  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "berzerkermodel"
  opts.location.find(" table tr:gt(1)").each ->
    $(this).find(".troop_icon").addClass "khornemark"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  SquadPoints = 105
  opts.location.find(".squadpoints").text(SquadPoints)

createDefaultThousandSonSquad = (opts = {}) ->
  opts.location.find(".squad_wrap").show()

  _.times(4, -> generateTroop(troop: opts.troop))
  createWeaponOptions(weapons: ["10kboltgun"], troops: opts.location.find('.army_squads_troops_weapon select'))
  createWeaponOptions(weapons: ["10kboltgun"], troops: opts.location.find(" table tr:nth-child(1)").find(".army_squads_troops_weapon select"))
  opts.location.find(" table tr:nth-child(1)").find(".troop_icon").addClass "tenkleader"
  opts.location.find(" table tr:gt(0)").each ->
    $(this).find("a.remove_troop").hide()
  opts.location.find(" table tr:gt(1)").each ->
    $(this).find(".troop_icon").addClass "tenk"
  SquadPoints = 150
  opts.location.find(".squadpoints").text(SquadPoints)

createSorcerer = (opts = {}) ->
  opts.location.find(".squad_wrap").show()
  createWeaponOptions(weapons: ["Force Axe", "Boltgun"], troops: opts.location.find('.army_squads_troops_weapon select'))

createKharn = (opts = {}) ->
  opts.location.find(".squad_wrap").show()
  createWeaponOptions(weapons: ["Axe", "plasmapistol"], troops: opts.location.find('.army_squads_troops_weapon select'))

weaponPointChart = (opts = {}) ->
  points = 0
  opts.troops.each ->
    switch $(this).val()
      when "autogun" then points += 1
      when "shotgun" then points += 2
      when "chainaxe", "combibolter", "sonicblaster" then points += 3
      when "flamer", "heavystubber", "meltabomb" then points += 5
      when "meltagun", "heavybotler", "autocannon" then points += 10
      when "plasmapistol", "plasmagun", "misssle launcher", "doomsiren" then points += 15
      when "lascannon" then points += 20
      when "powerfist" then points += 25
      when "blastmaster" then points += 30
  return do ->
    points

squadDetails = (opts = {}) ->
  squad =
    min: 0
    max: 0
    troop:

     0
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
      squad.max = 20
      squad.troop = 13
      squad.base = 75
      squad.havoc = 1
      squad.gunny = 1
      squad.basicWeapons = basicMarineWeapons
      squad.havocWeapons = havocWeapons
      squad.gunnyWeapons = gunnyWeapons
    when "Cultist"
      squad.min = 10
      squad.max = 35
      squad.troop = 4
      squad.base = 50
      squad.havoc = 0
      squad.gunny = 3
      squad.basicWeapons = basicMarineWeapons
      squad.gunnyWeapons = cultistGunnyWeapons
    when "Thousand Son"
      squad.min = 5
      squad.max = 20
      squad.troop = 23
      squad.base = 150
      squad.basicWeapons = ["10kboltgun"]
    when "Berzerker"
      squad.min = 5
      squad.max = 20
      squad.troop = 19
      squad.base = 105
      squad.basicWeapons = ["boltpistol, chainsword"]
    when "Choas Biker"
      squad.min = 3
      squad.max = 10
      squad.troop = 20
      squad.base = 70
      squad.basicWeapons = gunnyWeapons
  squad

countSquadPoints = (opts = {}) ->
  squadPoints = 0
  squad = squadDetails(type: opts.type)
  squadPoints += squad.base
  surplusTroops = opts.size - squad.min if surplusTroops isnt 0
  squadPoints += surplusTroops * squad.troop if surplusTroops isnt 0
  weaponPoints = weaponPointChart(troops: opts.troops)
  weaponPoints += weaponPointChart(troops: opts.secondWeapon)
  squadPoints += weaponPoints
  opts.table.find(".squadpoints").text(squadPoints)

changeTroopTypeInSquad = (opts = {}) ->
  table = opts.table
  createWeaponOptions(weapons: opts.specialWeapons, troops: table.find(" table tr:nth-child(#{opts.child})").find(".army_squads_troops_weapon select"))
  table.find(" table tr:nth-child(#{opts.child})").find(".troop_icon").removeClass opts.removeImage if opts.remove is true
  table.find(" table tr:nth-child(#{opts.child})").find(".troop_icon").addClass opts.image

cultistSquadWeaponRules = (opts = {}) ->
  if opts.size >= 20
    changeTroopTypeInSquad
      specialWeapons: cultistGunnyWeapons
      child: 3
      table: opts.table
      image: "gunny"
  if opts.size >= 30
    changeTroopTypeInSquad
      specialWeapons: cultistGunnyWeapons
      child: 4
      table: opts.table
      image: "gunny"
  if opts.size < 20
    changeTroopTypeInSquad(specialWeapons: basicMarineWeapons, table: opts.table, child: 3, image: "choasmarine", removeImage: "gunny", remove: true)
  if opts.size < 30
    changeTroopTypeInSquad(specialWeapons: basicMarineWeapons, table: opts.table, child: 4, image: "choasmarine", removeImage: "gunny", remove: true)

marineSquadWeaponRules = (opts = {}) ->
  if opts.size is 10
    changeTroopTypeInSquad
      specialWeapons: havocWeapons
      table: opts.table
      child: 3
      remove: true
      image: "havoc"
      removeImage: "choasmarine"
  if opts.size < 10
    changeTroopTypeInSquad(specialWeapons: basicMarineWeapons, table: opts.table, child: 3, image: "choasmarine")

addTroopRules = (opts = {}) ->
  table = opts.troop.closest(".squad")
  squad = squadDetails(type: opts.type)
  max = squad.max
  squadFull = (max - opts.size)
  generateTroop(troop: opts.troop)
  size = opts.size + 1
  switch opts.type
    when "Havoc" then changeTroopTypeInSquad(specialWeapons: basicMarineWeapons, table: table, child: 6, remove: true, table: table, image: "choasmarine", removeImage: "havoc")
    when "Marine" then marineSquadWeaponRules(size: size, table: table)
    when "Cultist" then cultistSquadWeaponRules(size: size, table: table)
  table.find(".add_troop").hide() if squadFull is 1
  extratroops = table.find(" table tr:gt(#{squad.min})")
  extratroops.each ->
    $(this).find("a.remove_troop").show()

removeTroopRules = (opts = {}) ->
  table = opts.location
  switch opts.type
    when "Marine" then marineSquadWeaponRules(size: opts.size, table: table)
    when "Cultist" then cultistSquadWeaponRules(size: opts.size, table: table)

  countSquadPoints(troops: opts.troops, table: table, size: opts.size, type: opts.type, secondWeapon: opts.secondWeapon)
  countArmyPoints ->

getSquadInfo = (squad) ->
  return do ->
    object: squad
    troops: squad.find('.army_squads_troops_weapon select')
    secondWeapon: squad.find('.army_squads_troops_weapon2 select')
    size: squad.find('.army_squads_troops_weapon').size()
    weapons: squad.find('.army_squads_troops_weapon select option')
    type: squad.find(".army_squads_name select").val()
    troop: squad.find("table tbody tr:last")
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
  squadType = $(".squad").find("h4")
  identifyHQInArmy(squadType: squadType)
  squadType.each ->
    switch $(this).text()
      when "Heavy" then heavy += 1
      when "Troops" then troop += 1
      when "Elite" then elite += 1
      when "Fast Attack" then fast += 1
      when "HQ" then hq += 1
  armyCompositionTable = $(".army_composition")
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
  squad.before squadClone unless opts.hidden is true
  squad.after squadClone if opts.hidden is true
  squadClone.hide() if opts.hidden is true
  $(".fields.squad:last").prev().find(".remove_troop").hide()

# Creat mandatory Choas Army squads
#
setUpChoasArmy = ->
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
  $(".squad").find(".squad_wrap").hide()

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

addSecondWeapon = (opts = {}) ->
  opts.troops.each ->
    switch $(this).val()
      when "boltpistol", "autopistol", "plasmapistol"
        $(this).closest('td').find(".army_squads_troops_weapon2 select").show()
      else
        $(this).closest('td').find(".army_squads_troops_weapon2 select").hide()

jQuery ->

  hideObjects = do ->
    $(".squadform").hide()

  createSquadFieldThatWillRemainHidden = do ->
    createNewTable(hidden: true)

  $(".army_faction select").change ->
    if $(this).val() is "Choas Force"
      setUpChoasArmy ->

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
    editTableWithProperOptions(type: choasHeavySupport, title: "Heavy")

  $("#add_fastattack").click ->
    event.preventDefault()
    createNewTable ->
    editTableWithProperOptions(type: choasFastAttack, title: "Fast Attack")

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
    removeTroopRules(troops: squad.troops, size: squad.size, location: location, type: squad.type, secondWeapon: squad.secondWeapon)
    location.find(".add_troop").show()

  $(".add_troop").click ->
    event.preventDefault()
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    addTroopRules(size: squad.size, troop: squad.troop, type: squad.type)
    newSquad = getSquadInfo(currentSquad)
    countSquadPoints(troops: newSquad.troops, table: currentSquad, size: newSquad.size, type: newSquad.type, secondWeapon: newSquad.secondWeapon)

  $(".army_squads_troops_weapon select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    addSecondWeapon(troops: squad.troops, table: currentSquad, size: squad.size, type: squad.type, secondWeapon: squad.secondWeapon)
    countSquadPoints(troops: squad.troops, table: currentSquad, size: squad.size, type: squad.type, secondWeapon: squad.secondWeapon)

  $(".army_squads_troops_weapon2 select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    countSquadPoints(troops: squad.troops, table: currentSquad, size: squad.size, type: squad.type, secondWeapon: squad.secondWeapon)

  $(".army_squads_name select").change ->
    currentSquad = $(this).closest(".squad")
    squad = getSquadInfo(currentSquad)
    while squad.size > 1  # reset troops in squad for when squad changes types
      $(this).closest(".squad").find("table tbody tr:last").remove()
      squad.size--
    squad = getSquadInfo(currentSquad)
    info = (troop: squad.troop, location: currentSquad)
    switch squad.type
      when "Marine" then createDefaultMarineSquad info
      when "Havoc"  then createDefaultHavocSquad info
      when "Cultist"  then createDefaultCultistSquad info
      when "Thousand Son" then createDefaultThousandSonSquad info
      when "Berzerker" then createDefaultBerzerkerSquad info
      when "LandRaider" then createLandraider info
      when "Sorcerer" then createSorcerer info
      when "Kharn" then createKharn info
      when "Choas Biker" then createChoasBiker info
    armyRules ->
    countArmyPoints ->

  # $("#click").click ->
