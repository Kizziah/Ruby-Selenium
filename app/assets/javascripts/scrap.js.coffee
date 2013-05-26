 #   options =
  #     "boltgun": "value1"
  #     "meltagun": "value2"
  #     "plasmagun": "value3"
  #     "lascannon": "value4"
  #   choice = $('.army_squads_troops_weapon:first select')
  #   choice.empty()
  #   $.each options, (key, value) ->
  #     choice.append $("<option></option>").attr("value", value).text(key)
  #   console.log $('.army_squads_troops_weapon:first select option:gt(1)').remove() # removes up to number






    # Array::diff = (a) ->
    #   @filter (i) ->
    #     not (a.indexOf(i) > -1)

    # x = [3, 2]
    # y = [1, 2, 3]
    # console.log y.diff(x)
    # y = _.without(y, x)


  # Faction =
  #   choas:
  #     squads:
  #       havoc:
  #         max
  #         min
  #         aviable_weapons: (squad_size) ->
  #           weapons = []
  #           weapons + [plasma] if squad_size > 5
  #       cultist:
  #     tanks:
  #     hq:
