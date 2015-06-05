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

  $('.employer-logo-image').click (e) ->
    $('.employer-logo-image-highlighted').removeClass('active')
    $('.employer-logo-image-highlighted').hide()
    $('.employer-logo-image').show()
    $(e.target).hide()
    $(e.target).siblings('.employer-logo-image-highlighted').addClass('active')
    $(e.target).siblings('.employer-logo-image-highlighted').show()
    name = $(e.target).siblings('.employer-logo-image-highlighted').attr 'name'
    $('.employer-details').hide()
    $("##{name}").show()
    $(".employer.timeline-color-img").hide()
    $(".employer.timeline-color-img##{name}-timeline").show()
    $(".employer.bg-image").hide()
    $(".employer.bg-image##{name}-bg").show()
    $(".employer-details").removeClass "gqti"
    $(".employer-details").removeClass "mizzou"
    $(".employer-details").removeClass "epm"
    $(".employer-details").removeClass "aaon"
    $(".employer-details").removeClass "waterfield"
    $(".employer-details").addClass name


  $('.employer-logo-image-highlighted').click (e) ->
    $('.employer-logo-image-highlighted').removeClass('active')
    $('.employer-logo-image-highlighted').hide()
    $('.employer-logo-image').show()
    $(e.target).siblings('.employer-logo-image').hide()
    $(e.target).addClass('active')
    $(e.target).show()
    name = $(e.target).attr 'name'
    $('.employer-details').hide()
    $("##{name}").show()
    $(".employer.timeline-color-img").hide()
    $(".employer.timeline-color-img##{name}-timeline").show()
    $(".employer.bg-image").hide()
    $(".employer.bg-image##{name}-bg").show()
    $(".employer-details").removeClass "gqti"
    $(".employer-details").removeClass "mizzou"
    $(".employer-details").removeClass "epm"
    $(".employer-details").removeClass "aaon"
    $(".employer-details").removeClass "waterfield"
    $(".employer-details").addClass name

  $('.education-logo-image').mouseenter (e) ->
    $(e.target).hide()
    $(e.target).siblings('.education-logo-image-highlighted').show()

  $('.education-logo-image-highlighted').mouseleave (e) ->
    unless $(e.target).hasClass('active')
      $(e.target).hide()
      $(e.target).siblings('.education-logo-image').show()

  $('.education-logo-image').click (e) ->
    $('.education-logo-image-highlighted').removeClass('active')
    $('.education-logo-image-highlighted').hide()
    $('.education-logo-image').show()
    $(e.target).hide()
    $(e.target).siblings('.education-logo-image-highlighted').addClass('active')
    $(e.target).siblings('.education-logo-image-highlighted').show()
    name = $(e.target).siblings('.education-logo-image-highlighted').attr 'name'
    $('.education-details').hide()
    $("##{name}").show()
    $(".education.timeline-color-img").hide()
    $(".education.timeline-color-img##{name}-timeline").show()
    $(".education.bg-image").hide()
    $(".education.bg-image##{name}-bg").show()
    $(".education-details").removeClass "iit"
    $(".education-details").removeClass "uiuc"
    $(".education-details").removeClass "mu"
    $(".education-details").addClass name

  $('.education-logo-image-highlighted').click (e) ->
    $('.education-logo-image-highlighted').removeClass('active')
    $('.education-logo-image-highlighted').hide()
    $('.education-logo-image').show()
    $(e.target).siblings('.education-logo-image').hide()
    $(e.target).addClass('active')
    $(e.target).show()
    name = $(e.target).attr 'name'
    $('.education-details').hide()
    $("##{name}").show()
    $(".education.timeline-color-img").hide()
    $(".education.timeline-color-img##{name}-timeline").show()
    $(".education.bg-image").hide()
    $(".education.bg-image##{name}-bg").show()
    $(".education-details").removeClass "iit"
    $(".education-details").removeClass "uiuc"
    $(".education-details").removeClass "mu"
    $(".education-details").addClass name
