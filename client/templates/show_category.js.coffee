Template.showCategory.helpers
  posts: ->
    Posts.find
      category: @category
