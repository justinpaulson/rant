Template.layout.helpers
  categories: -> Categories.find({})
  admin_user: ->
    username = Meteor.user().username
    if username == 'justinp' || username == 'sarahp' then true else false
