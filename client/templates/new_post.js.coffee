Template.newPost.events
  "click #save": (e) ->
    Posts.insert
      _id:  new Meteor.Collection.ObjectID(),
      title: $("[name='title']").val(),
      author: $("[name='author']").val(),
      category: $("[name='category']").val(),
      text: $("[name='text']").val(),
      short_text: $("[name='text']").val(),
      createdAt: new Date()

    window.location = "/"

  "click #cancel": (e) ->
    window.location = "/"
 
Template.newPost.helpers
  categories: -> Categories.find({})
