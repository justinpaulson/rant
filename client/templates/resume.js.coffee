Template.resume.events

Template.resume.helpers

Template.resume.rendered = () ->
  mixpanel.track "About Viewed"
    
  $('.employer-logo-image').mouseenter (e) ->
    $(e.target).hide()
    $(e.target).siblings('.employer-logo-image-highlighted').show()

  $('.employer-logo-image-highlighted').mouseleave (e) ->
    unless $(e.target).hasClass('active')
      $(e.target).hide()
      $(e.target).siblings('.employer-logo-image').show()

  $('.employer-logo-image-highlighted').click (e) =>
    $('.employer-logo-image-highlighted').removeClass('active')
    $('.employer-logo-image-highlighted').hide()
    $('.employer-logo-image').show()
    name = $(e.target).attr 'name'
    $("##{@current_employer}").slideUp()
    $(".employer.timeline-color-img").hide()
    $(".employer-details").removeClass "gqti"
    $(".employer-details").removeClass "mizzou"
    $(".employer-details").removeClass "epm"
    $(".employer-details").removeClass "aaon"
    $(".employer-details").removeClass "waterfield"
    console.log "Current: #{@current_employer} trying Name: #{name}"
    unless @current_employer == name
      $(e.target).siblings('.employer-logo-image').hide()
      $(e.target).addClass('active')
      $(e.target).show()
      $("##{name}").slideDown()
      $(".employer.timeline-color-img##{name}-timeline").show()
      $(".employer-details").addClass name
      @current_employer = name
    else
      @current_employer = ""

  $('.education-logo-image').mouseenter (e) ->
    $(e.target).hide()
    $(e.target).siblings('.education-logo-image-highlighted').show()

  $('.education-logo-image-highlighted').mouseleave (e) ->
    unless $(e.target).hasClass('active')
      $(e.target).hide()
      $(e.target).siblings('.education-logo-image').show()

  $('.education-logo-image-highlighted').click (e) =>
    $('.education-logo-image-highlighted').removeClass('active')
    $('.education-logo-image-highlighted').hide()
    $('.education-logo-image').show()
    name = $(e.target).attr 'name'
    $("##{@current_education}").slideUp()
    $(".education.timeline-color-img").hide()
    $(".education-details").removeClass "iit"
    $(".education-details").removeClass "uiuc"
    $(".education-details").removeClass "mu"
    unless @current_education == name
      $(e.target).addClass('active')
      $(e.target).show()
      $(e.target).siblings('.education-logo-image').hide()
      $("##{name}").slideDown()
      $(".education.timeline-color-img##{name}-timeline").show()
      $(".education-details").addClass name
      @current_education = name
    else
      @current_education = ""
