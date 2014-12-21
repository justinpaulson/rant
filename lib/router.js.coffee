Router.configure
  layoutTemplate: 'layout',
  waitOn: ->
    $('li').removeClass 'active'


Router.route '/', name: 'allPosts'
Router.route '/posts/new', name: 'newPost'
Router.route '/posts/:_id', 
  name: 'showPost',
  waitOn: ->
    $('li').removeClass 'active'
    Meteor.call "getPost", (new Meteor.Collection.ObjectID(@params._id)), (error, result) -> 
      if error
        console.log error
      else
        Session.set 'id', result._id._str
        Session.set 'title', result.title
        Session.set 'text', result.text
        Session.set 'category_image', result.category_image
        Session.set 'category_color', result.category_color
Router.route '/posts/:_id/edit',
  name: 'editPost',
  data: -> Posts.findOne(new Meteor.Collection.ObjectID(@params._id))
Router.route '/:category',
  name: 'showCategory',
  waitOn: ->
    Meteor.call "getCategoryPosts", (@params.category), (error, result) -> 
      if error
        console.log error
      else 
        Session.set 'posts', result
    $("li##{@params.category}").addClass 'active'
Router.route '/categories/edit', name: 'editCategories'