# Hide the .url div first
hideAllDivs = ->
  $(".url").hide()

# When tweet or retweet is selected, show the .url div
handleNewSelection = ->
  hideAllDivs()
  switch $(this).val()
    when "tweet"
      $(".url").show()
    when "retweet"
      $(".url").show()

$(document).ready ->
  $("#message_kind").change handleNewSelection
  
  # Run the event handler once now to ensure everything is as it should be
  handleNewSelection.apply $("#message_kind")
