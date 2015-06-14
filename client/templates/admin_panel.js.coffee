Template.adminPanel.helpers
  logged_in: -> Meteor.user()
  admin_user: -> if Meteor.users.findOne().admin then true else false
