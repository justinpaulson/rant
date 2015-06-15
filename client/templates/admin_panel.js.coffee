Template.adminPanel.helpers
  logged_in: -> Meteor.user()
  admin_user: -> if Meteor.users.findOne().admin then true else false

Template.adminPanel.rendered = () ->
  console.log "We be rendering!"
  $('#import-moves').click (e) =>
    console.log "We be importing moves!"
