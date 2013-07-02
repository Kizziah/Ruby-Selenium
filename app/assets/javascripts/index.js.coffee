jQuery ->

  $(".index > li ul").hide()

  $("ul > li").hover ->
    $(this).find("ul").show()
  $(".index > li").mouseleave ->
    $(this).find("ul").hide()
