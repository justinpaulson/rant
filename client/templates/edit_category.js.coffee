Template.editCategories.events
  "click #save": (e) ->
    Categories.insert
      _id:  new Meteor.Collection.ObjectID(),
      color: $("[name='color']").val(),
      name: $("[name='name']").val(),
      image: $("[name='image']").val(),
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

  "click button.upload": (e) ->
    e.preventDefault()
    files = $("input.file_bag")[0].files
    S3.upload files, "/icons", (e,r) =>
      $('.uploaded-image').html "<img src='#{r.url}' height=50 width=50>"
      $("[name='image']").val r.url

  "change input.file_bag": ->
    $('.progress-label').html $('input.file_bag')[0].files[0].name

Template.editCategories.helpers
  categories: -> Categories.find({})

  "files": -> S3.collection.find()

Template.editCategories.rendered = () ->
  $(".color-picker").colorpicker()

  Uploader.finished = (index, file) ->
    console.log "This is the file"
    console.log "uploaded: #{file.name}"
    $('.uploaded-image').html = "<img src='#{file.name}' height=50 width=50>"
