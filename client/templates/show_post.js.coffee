Template.showPost.helpers
  logged_in: -> Meteor.user()
  id: -> Session.get 'id'
  text: -> Session.get 'text'
  category_image: -> Session.get 'category_image'
  category_color: -> Session.get 'category_color'
  admin_user: -> if Meteor.users.findOne().admin then true else false
  createdAtFormatted: -> moment(Session.get('createdAt')).format('MMMM Do YYYY')
