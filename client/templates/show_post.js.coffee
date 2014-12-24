Template.showPost.helpers
  logged_in: -> Meteor.user()
  id: -> Session.get 'id'
  title: -> Session.get 'title'
  text: -> Session.get 'text'
  category_image: -> Session.get 'category_image'
  category_color: -> Session.get 'category_color'
  admin_user: ->
    username = Meteor.user().username
    if username == 'justinp' || username == 'sarahp' then true else false

