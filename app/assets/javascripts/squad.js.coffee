jQuery ->

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

  $("#add_squad").click ->
    event.preventDefault()
    squadMatcher = /\d+/
    newNumber = _.random(0, 100000)
    squad = $(".fields.squad:last")
    squadClone = squad.clone(true)

    # TODO: Remove extra squad fields

    renameField
      field: squadClone.find('.army_squads_name select')
      number: newNumber
      matcher: squadMatcher
    renameField
      field: squadClone.find('.army_squads_troops_weapon select')
      number: newNumber
      matcher: squadMatcher
    squad.after squadClone

  $(".remove_squad").click ->
    event.preventDefault()
    $(this).closest(".squad").remove()

  $(".add_troop").click ->
    event.preventDefault()
    troop = $(this).closest(".squad").find("table tbody tr:last")
    troopClone = troop.clone(true)
    renameField
      field: troopClone.find('.army_squads_troops_weapon select')
      number: _.random(0, 100000)
      matcher: /(\d+)(?!.*\d)/
    troop.after troopClone
