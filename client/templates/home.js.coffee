Template.home.helpers
  posts: -> 
    Session.get('posts').reverse()

Template.home.created = ->
  Meteor.call "getAllPosts", (error, result) -> 
    if error
      console.log error
    else 
      Session.set 'posts', result

Template.home.rendered = () ->
  console.log "rendered Home!"
