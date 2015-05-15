Template.resume.events

Template.resume.helpers

Template.resume.rendered = () ->
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
