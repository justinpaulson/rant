Template.editPost.events
  "click #save": (e) ->
    Posts.update @_id,
      $set:
        title: $("[name='title']").val(),
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
  selected: (option, value) ->
    if option == value then 'selected' else ''

  categories: -> Categories.find({})
