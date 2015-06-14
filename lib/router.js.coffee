Router.configure
  layoutTemplate: 'layout',
  waitOn: ->
    $('li').removeClass 'active'

Router.route '/', name: 'home'
Router.route '/blog', name: 'allPosts',
  waitOn: ->
    $('li.navbar-link').removeClass 'active'
    $('li#blog-link').addClass 'active'
    $("li.sidebar-link").removeClass 'active'
Router.route '/blog/posts/new', name: 'newPost',
  waitOn: ->
    $('li.navbar-link').removeClass 'active'
    $('li#blog-link').addClass 'active'
    $("li.sidebar-link").removeClass 'active'
Router.route '/blog/posts/:_id', 
  name: 'showPost',
  waitOn: ->
    $('li.navbar-link').removeClass 'active'
    $('li#blog-link').addClass 'active'
    Meteor.call "getPost", (new Meteor.Collection.ObjectID(@params._id)), (error, result) -> 
      if error
        console.log error
      else
        Session.set 'id', result._id._str
        Session.set 'title', result.title
        Session.set 'author', result.author
        Session.set 'text', result.text
        Session.set 'url', result.url
        Session.set 'createdAt', result.createdAt
        Session.set 'category_image', result.category_image
        Session.set 'category_color', result.category_color
        $("li##{result.category}").addClass 'active'
        mixpanel.track "Blog Post Viewed",
          "title": result.title,
          "id": result._id._str
  data: ->
    url: Session.get 'url'
    author: Session.get 'author'
    title: Session.get 'title'
Router.route '/blog/posts/:_id/edit',
  name: 'editPost',
  waitOn: ->
    $('li.navbar-link').removeClass 'active'
    $('li#blog-link').addClass 'active'
    Meteor.call "getPost", (new Meteor.Collection.ObjectID(@params._id)), (error, result) -> 
      if error
        console.log error
      else
        Session.set 'id', result._id
        Session.set 'title', result.title
        Session.set 'author', result.author
        Session.set 'text', result.text
        Session.set 'createdAt', result.createdAt
        Session.set 'category_image', result.category_image
        Session.set 'category_color', result.category_color
        $("li##{result.category}").addClass 'active'
Router.route '/blog/:category',
  name: 'showCategory',
  waitOn: ->
    $('li.navbar-link').removeClass 'active'
    $('li#blog-link').addClass 'active'
    Meteor.call "getCategoryPosts", (@params.category), (error, result) => 
      if error
        console.log error
      else 
        Session.set 'posts', result
        $("li##{@params.category}").addClass 'active'
        mixpanel.track "Blog Category Viewed",
          "category": @params.category
Router.route '/work/about', 
  name: 'resume',
  waitOn: ->
    $('li.navbar-link').removeClass 'active'
    $('li#resume-link').addClass 'active'
Router.route '/work/projects', 
  name: 'projects',
  waitOn: ->
    $('li.navbar-link').removeClass 'active'
    $('li#projects-link').addClass 'active'
Router.route '/blog/categories/edit', name: 'editCategories',
  waitOn: ->
    $('li.navbar-link').removeClass 'active'
    $('li#blog-link').addClass 'active'
Router.route '/admin_panel', name: 'adminPanel'
