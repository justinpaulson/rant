Template.editPost.events
  "click #save": (e) ->
    @_id = Session.get 'id'
    console.log @_id
    Posts.update @_id,
      $set:
        title: $("[name='title']").val(),
        author: $("[name='author']").val(),
        category: $("[name='category']").val(),
        text: $("[name='text']").val(),
        short_text: $("[name='text']").val()

    window.location = "/posts/#{@_id._str}"
    
  "click #delete": (e) ->
    if confirm('Are you sure you want to delete this post?')
      Posts.remove @_id
      window.location = "/"


  "click #cancel": (e) ->
    window.location = "/posts/#{@_id._str}"

Template.editPost.helpers
  logged_in: -> Meteor.user()
  title: -> Session.get 'title'
  author: -> Session.get 'author'
  text: -> Session.get 'text'
  category_image: -> Session.get 'category_image'
  category_color: -> Session.get 'category_color'
  admin_user: -> if Meteor.users.findOne().admin then true else false

  selected: (option, value) ->
    if option == value then 'selected' else ''

  categories: -> Categories.find({})
