Template.allPosts.helpers
  posts: -> 
    Session.get('posts').reverse()
    
Template.allPosts.created = ->
  Meteor.call "getAllPosts", (error, result) -> 
    if error
      console.log error
    else 
      Session.set 'posts', result
