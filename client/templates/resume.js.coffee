Template.resume.events

Template.resume.helpers

Template.resume.rendered = () ->
  mixpanel.track "About Viewed"

  $('.employer-logo-image').click (e) =>
    $(".employer-logo-image").removeClass 'active'
    $(".employer-logo-image").addClass 'inactive'
    $("##{@current_employer}").slideUp()
    $(".employer.timeline-color-img").hide()
    $(".employer-details").removeClass @current_employer
    name = $(e.target).attr 'name'
    unless @current_employer == name
      $(e.target).removeClass 'inactive'
      $(e.target).addClass 'active'
      $("##{name}").slideDown()
      $(".employer.timeline-color-img##{name}-timeline").show()
      $(".employer-details").addClass name
      @current_employer = name
    else
      @current_employer = ""

  $('.education-logo-image').click (e) =>
    $('.education-logo-image').removeClass 'active'
    $('.education-logo-image').addClass 'inactive'
    $("##{@current_education}").slideUp()
    $(".education.timeline-color-img").hide()
    $(".education-details").removeClass @current_education
    name = $(e.target).attr 'name'
    unless @current_education == name
      $(e.target).removeClass 'inactive'
      $(e.target).addClass 'active'
      $("##{name}").slideDown()
      $(".education.timeline-color-img##{name}-timeline").show()
      $(".education-details").addClass name
      @current_education = name
    else
      @current_education = ""
