Router.configure
 layoutTemplate: 'layout'

Router.route '/', name: 'allPosts'
Router.route '/posts/new', name: 'newPost'
Router.route '/posts/:_id', 
  name: 'showPost',
  data: -> Posts.findOne(new Meteor.Collection.ObjectID(@params._id))
Router.route '/posts/:_id/edit',
  name: 'editPost',
  data: -> Posts.findOne(new Meteor.Collection.ObjectID(@params._id))
Router.route '/:category',
  name: 'showCategory',
  data: -> category: @params.category
Router.route '/categories/edit', name: 'editCategories'
