Template.newCategory.events
  "click #save": (e) ->
    Categories.insert
      _id:  new Meteor.Collection.ObjectID(),
      title: $("[name='title']").val(),
      name: $("[name='name']").val(),
      createdAt: new Date()

    window.location = "/"

  "click #cancel": (e) ->
    window.location = "/"
