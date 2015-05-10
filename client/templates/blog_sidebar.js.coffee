Template.blogSidebar.helpers
  categories: -> Categories.find({})
  admin_user: -> if Meteor.users.findOne().admin then true else false
