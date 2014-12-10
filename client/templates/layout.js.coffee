Template.layout.helpers
  categories: -> Categories.find({})
  logged_in: -> Meteor.user()
