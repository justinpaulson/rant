Template.editCategories.events
  "click #save": (e) ->
    Categories.insert
      _id:  new Meteor.Collection.ObjectID(),
      color: $("[name='color']").val(),
      name: $("[name='name']").val(),
      createdAt: new Date()
    window.location.reload()

  "click #delete": (e) =>
    name = $("[name='category']").val()
    if confirm("Are you sure you want to delete the #{name} category?")
      Meteor.call "getCategories", name, (error, results) -> 
        Categories.remove (new Meteor.Collection.ObjectID(results._id._str)), ->
          window.location.reload()

  "click #cancel": (e) ->
    window.location = "/"

Template.editCategories.helpers
  categories: -> Categories.find({})

Template.editCategories.rendered = () ->
  $(".color-picker").colorpicker()

  Uploader.finished = (index, file) ->
    console.log "This is the file"
    console.log "uploaded: #{file.name}"
    $('.uploaded-image').html = "<img src='#{file.name}' height=50 width=50>"
